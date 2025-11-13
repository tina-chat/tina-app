import 'package:langchain/langchain.dart';

/// Web search tool implementation for use with LangChain.
///
/// This is a demonstration tool that can be integrated with the chat system
/// to allow the AI to search the web for current information.
///
/// Note: This is a mock implementation for demonstration purposes.
/// In production, you would integrate with a real search API like
/// Google Custom Search API, Bing Search API, or similar.

/// Represents a single search result
class SearchResult {
  final String title;
  final String url;
  final String snippet;

  SearchResult({required this.title, required this.url, required this.snippet});
}

/// Mock search implementation - replace with real API call in production
Future<List<SearchResult>> performMockSearch(
  String query,
  int maxResults,
) async {
  // Simulate API delay
  await Future.delayed(const Duration(seconds: 1));

  // Mock search results - in production, this would call a real search API
  return [
    SearchResult(
      title: 'Information about $query',
      url: 'https://example.com/search?q=${Uri.encodeComponent(query)}',
      snippet:
          'This is a mock search result for "$query". In a real implementation, this would contain actual search results from a search engine API.',
    ),
    SearchResult(
      title: 'Latest news on $query',
      url: 'https://news.example.com/${Uri.encodeComponent(query)}',
      snippet:
          'Mock news result about "$query". This would typically contain recent news articles and information about the search topic.',
    ),
    SearchResult(
      title: 'Wikipedia entry for $query',
      url: 'https://en.wikipedia.org/wiki/${Uri.encodeComponent(query)}',
      snippet:
          'Comprehensive information about "$query" from Wikipedia. This would typically provide detailed background information and facts.',
    ),
  ].take(maxResults).toList();
}

String formatSearchResults(String query, List<SearchResult> results) {
  if (results.isEmpty) {
    return 'No search results found for: "$query"';
  }

  final buffer = StringBuffer();
  buffer.writeln('Search results for "$query":\n');

  for (int i = 0; i < results.length; i++) {
    final result = results[i];
    buffer.writeln('${i + 1}. ${result.title}');
    buffer.writeln('   URL: ${result.url}');
    buffer.writeln('   ${result.snippet}');
    if (i < results.length - 1) {
      buffer.writeln();
    }
  }

  return buffer.toString();
}

/// Web search handler function for the tool
Future<String> webSearchHandler(Map<String, dynamic> input) async {
  try {
    final query = input['query'] as String?;
    final maxResults = (input['max_results'] as int?) ?? 5;

    if (query == null || query.trim().isEmpty) {
      return 'Error: Search query is required';
    }

    // Perform mock search - replace with real API call in production
    final results = await performMockSearch(query.trim(), maxResults);

    return formatSearchResults(query, results);
  } catch (e) {
    return 'Error performing web search: ${e.toString()}';
  }
}

/// Factory function to create the web search tool specification
ToolSpec createWebSearchToolSpec() {
  return ToolSpec(
    name: 'web_search',
    description:
        'Search the web for information about current events, facts, or topics. Use this when you need up-to-date information or when user asks about recent events.',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description':
              'The search query - what you want to search for on the web',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of results to return (default: 5)',
          'default': 5,
        },
      },
      'required': ['query'],
    },
  );
}
