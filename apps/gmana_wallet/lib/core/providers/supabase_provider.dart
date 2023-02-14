import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'supabase_provider.g.dart';

// final supabaseProvider = Provider((ref) => Supabase.instance.client);
@Riverpod(keepAlive: true)
SupabaseClient supabase(SupabaseRef ref) => Supabase.instance.client;
