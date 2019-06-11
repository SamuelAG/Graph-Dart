class Graph {
  Node root;
  int vertex;
  
  Graph() {
    this.vertex = 0;
    this.root = null;
  }

  void addNode(String name) {
    if(root == null) {
      root = Node(name);
    } else {
      Node newNode = Node(name);
      newNode.next = root;
      this.root = newNode;
    }
    vertex++;
  }

  void searchNode(String name) {
    Node iterator = root;
    while(iterator != null && iterator.name != name) {
      iterator = iterator.next;
    }
    if(iterator != null) {
      print("Nó $name encontrado: ");
      print("${iterator.name}: ${iterator.edges}");
    } else {
      print("Nó $name não encontrado");
    }
    
  }

  void showGraph() {
    Node iterator = root;
    print("Adjacency list:");
    while(iterator != null) {
      print("${iterator.name}: ${iterator.edges}");
      iterator = iterator.next;
    }
  }

  void addEdge(String start, String end, int cost) {
    Node newNode = Node(end);
    Node iterator = root;
    while(iterator.name != start && iterator != null) {
      iterator = iterator.next;
    }
    iterator.edges.add(Edge(newNode, cost));

    // Only for undirected graphs
    newNode = Node(start);
    iterator = root;
    while(iterator.name != end && iterator != null) {
      iterator = iterator.next;
    }
    iterator.edges.add(Edge(newNode, cost));
  }

}

class Edge {
  Node edge;
  int cost;

  Edge(this.edge, this.cost);

  @override
  String toString() {
    return "(${edge.name}(${cost})";
  }
}

class Node {
  Node next;
  List<Edge> edges;
  String name;

  Node(this.name) {
    this.edges = [];
    this.next = null;
  }

  @override
  String toString() {
    return name;
  }
}

void main() {
  var g = Graph();
  g.addNode("Fortaleza");
  g.addNode("Caucaia");
  g.addNode("Natal");
  g.addNode("Belo Horizonte");
  g.addNode("São Paulo");
  g.addEdge("Fortaleza", "Caucaia", 5);
  g.addEdge("Fortaleza", "São Paulo", 50);
  g.addEdge("Caucaia", "Natal", 30);
  g.addEdge("Caucaia", "Belo Horizonte", 45);
  g.addEdge("Caucaia", "São Paulo", 55);
  g.addEdge("Natal", "Belo Horizonte", 25);
  g.addEdge("Belo Horizonte", "São Paulo", 20);
  g.showGraph();
  print("");
  g.searchNode("Fortaleza");
  g.searchNode("Maracanau");
}