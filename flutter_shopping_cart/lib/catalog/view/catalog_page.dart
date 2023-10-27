import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';
import 'package:shimmer/shimmer.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is CatalogLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  const CatalogAppBar(),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                const CatalogAppBar(),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    switch (state) {
                      case CatalogLoading():
                        return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      case CatalogError():
                        return const SliverFillRemaining(
                          child: Text('Something went wrong!'),
                        );
                      case CatalogLoaded():
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => CatalogListItem(
                              state.catalog.getByPosition(index),
                            ),
                            childCount: state.catalog.itemNames.length,
                          ),
                        );
                      default:
                        return const SliverFillRemaining(
                          child: Text('Something went wrong!'),
                        );
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({required this.item, super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator(),
          CartError() => const Text('Something went wrong!'),
          CartLoaded() => Builder(
              builder: (context) {
                final isInCart = state.cart.items.contains(item);
                return TextButton(
                  style: TextButton.styleFrom(
                    disabledForegroundColor: theme.primaryColor,
                  ),
                  onPressed: isInCart
                      ? null
                      : () => context.read<CartBloc>().add(CartItemAdded(item)),
                  child: isInCart
                      ? const Icon(Icons.check, semanticLabel: 'ADDED')
                      : const Text('ADD'),
                );
              },
            )
        };
      },
    );
  }
}

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).pushNamed('/cart'),
        ),
      ],
    );
  }
}

class CatalogListItem extends StatelessWidget {
  const CatalogListItem(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleLarge;
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is CatalogLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: LimitedBox(
                maxHeight: 48,
                child: Row(
                  children: [
                    AspectRatio(aspectRatio: 1, child: ColoredBox(color: item.color)),
                    const SizedBox(width: 24),
                    Expanded(child: Text(item.name, style: textTheme)),
                    const SizedBox(width: 24),
                    AddButton(item: item),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: LimitedBox(
              maxHeight: 48,
              child: Row(
                children: [
                  AspectRatio(aspectRatio: 1, child: ColoredBox(color: item.color)),
                  const SizedBox(width: 24),
                  Expanded(child: Text(item.name, style: textTheme)),
                  const SizedBox(width: 24),
                  AddButton(item: item),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
