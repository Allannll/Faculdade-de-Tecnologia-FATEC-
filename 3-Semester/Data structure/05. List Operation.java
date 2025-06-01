// Exercise 1
public static int countCircularListNodes(Node head) {
    if (head == null) return 0;
    int count = 1;
    Node current = head.next;
    while (current != head) {
        count++;
        current = current.next;
    }
    return count;
}

// Exercise 2
public static int countOccurrences(Node head) {
    System.out.print("Enter value to count occurrences: ");
    int x = scanner.nextInt();
    int count = 0;
    Node current = head;
    while (current != null) {
        if (current.value == x) {
            count++;
        }
        current = current.next;
    }
    return count;
}

// Exercise 3
public static int countGreaterThanXCircular(Node head) {
        System.out.print("Enter value of X: ");
        int x = scanner.nextInt();
        if (head == null) return 0;
        int count = 0;
        Node current = head;
        do {
            if (current.value > x) {
                count++;
            }
            current = current.next;
        } while (current != head);
        return count;
}

// Exercise 4  
public static int countLessThanXWithDescriptor(ListDescriptor descriptor) {
    System.out.print("Enter value of X: ");
    int x = scanner.nextInt();
    int count = 0;
    Node current = descriptor.head;
    while (current != null) {
        if (current.value < x) {
            count++;
        }
        current = current.next;
    }
    return count;
}

// Exercise 5
public ListPair splitOddEven(Node head) {
    Node oddHead = null, evenHead = null, oddTail = null, evenTail = null;
    Node current = head;
    while (current != null) {
        if (current.value % 2 == 0) {
            if (evenHead == null) evenHead = evenTail = current;
            else {
                evenTail.next = current;
                evenTail = current;
            }
        } else {
            if (oddHead == null) oddHead = oddTail = current;
            else {
                oddTail.next = current;
                oddTail = current;
            }
        }
        current = current.next;
    }
    if (evenTail != null) evenTail.next = null;
    if (oddTail != null) oddTail.next = null;
    return new ListPair(oddHead, evenHead);
}

// Exercise 6 
public ListPair splitLessGreaterThanX(Node head, int x) {
    Node lessHead = null, greaterHead = null, lessTail = null, greaterTail = null;
    Node current = head;
    while (current != null) {
        if (current.value < x) {
            if (lessHead == null) lessHead = lessTail = current;
            else {
                lessTail.next = current;
                lessTail = current;
            }
        } else {
            if (greaterHead == null) greaterHead = greaterTail = current;
            else {
                greaterTail.next = current;
                greaterTail = current;
            }
        }
        current = current.next;
    }
    if (lessTail != null) lessTail.next = null;
    if (greaterTail != null) greaterTail.next = null;
    return new ListPair(lessHead, greaterHead);
}

// Exercise 7
public static Result replaceXWithY(Node head) {
    System.out.print("Enter value to replace X: ");
    int x = scanner.nextInt();
    System.out.print("Enter new value Y: ");
    int y = scanner.nextInt();
    int count = 0;
    Node current = head;
    while (current != null) {
        if (current.value == x) {
            current.value = y;
            count++;
        }
        current = current.next;
    }
    return new Result(head, count);
}

// Exercise 8
public Node removeElement(Node head, int element) {
    while (head != null && head.value == element) {
        head = head.next;
    }
    Node current = head;
    while (current != null && current.next != null) {
        if (current.next.value == element) {
            current.next = current.next.next;
        } else {
            current = current.next;
        }
    }
    return head;
}

// Exercise 9
public class OperationCount {
    public int insertCount = 0;
    public int deleteCount = 0;
}

public void countOperations(Node head, boolean isInsert) {
    OperationCount opCount = new OperationCount();
    if (isInsert) opCount.insertCount++;
    else opCount.deleteCount++;
}

// Exercise 10
public int getFirstNode(Node head) {
    if (head != null) return head.value;
    return -1;
}

// Exercise 11
public int getLastNode(Node head) {
    if (head == null) return -1;
    Node current = head;
    while (current.next != null) {
        current = current.next;
    }
    return current.value;
}

// Exercise 12
public Node getLastNodePointer(Node head) {
    if (head == null) return null;
    Node current = head;
    while (current.next != null) {
        current = current.next;
    }
    return current;
}

// Exercise 13
public static Node insertAfterNth(Node head) {
    System.out.print("Enter position (n): ");
    int n = scanner.nextInt();
    System.out.print("Enter value to insert: ");
    int value = scanner.nextInt();
    Node current = head;
    for (int i = 1; i < n && current != null; i++) {
        current = current.next;
    }
    if (current != null) {
        Node newNode = new Node(value);
        newNode.next = current.next;
        current.next = newNode;
    }
    return head;
}

// Exercise 14
public static Node insertBeforeNth(Node head) {
    System.out.print("Enter position (n): ");
    int n = scanner.nextInt();
    System.out.print("Enter value to insert: ");
    int value = scanner.nextInt();
    if (n == 1) {
        Node newNode = new Node(value);
        newNode.next = head;
        return newNode;
    }
    Node current = head;
    for (int i = 1; i < n - 1 && current != null; i++) {
        current = current.next;
    }
    if (current != null) {
        Node newNode = new Node(value);
        newNode.next = current.next;
        current.next = newNode;
    }
    return head;
}

    // Exercise 15
public Node removeNth(Node head) {
    System.out.print("Enter the position of the node to remove: ");
    int n = scanner.nextInt();
    if (n == 1) return head.next;
        Node current = head;
    for (int i = 1; i < n - 1 && current != null; i++) {
        current = current.next;
    }
    if (current != null && current.next != null) {
        current.next = current.next.next;
    }
    return head;
}



    // Exercise 16
    public Node mergeSortedLists(Node l1, Node l2) {
        if (l1 == null) return l2;
        if (l2 == null) return l1;
        if (l1.value < l2.value) {
            l1.next = mergeSortedLists(l1.next, l2);
            return l1;
        } else {
            l2.next = mergeSortedLists(l1, l2.next);
            return l2;
        }
    }

    // Exercise 17
    public Node interlaceLists(Node l1, Node l2) {
        if (l1 == null) return l2;
        if (l2 == null) return l1;
        Node head = l1;
        Node current1 = l1;
        Node current2 = l2;
        while (current1 != null && current2 != null) {
            Node temp1 = current1.next;
            Node temp2 = current2.next;
            current1.next = current2;
            if (temp1 == null) break;
            current2.next = temp1;
            current1 = temp1;
            current2 = temp2;
        }
        return head;
    }

    // Exercise 18
    public Node concatenateLists(Node l1, Node l2) {
        if (l1 == null) return l2;
        Node current = l1;
        while (current.next != null) {
            current = current.next;
        }
        current.next = l2;
        return l1;
    }

    // Exercise 19
    public Node copyList(Node head) {
        if (head == null) return null;
        Node newHead = new Node(head.value);
        Node current = head.next;
        Node newCurrent = newHead;
        while (current != null) {
            newCurrent.next = new Node(current.value);
            newCurrent = newCurrent.next;
            current = current.next;
        }
        return newHead;
    }

    // Exercise 20
    public boolean areListsIdentical(Node head1, Node head2) {
        Node current1 = head1, current2 = head2;
        while (current1 != null && current2 != null) {
            if (current1.value != current2.value) return false;
            current1 = current1.next;
            current2 = current2.next;
        }
        return current1 == null && current2 == null;
    }

// Exercise 21
public int sumList(Node head) {
    int sum = 0;
    Node current = head;
    while (current != null) {
        sum += current.value;
        current = current.next;
    }
    return sum;
}

// Exercise 22
public int productList(Node head) {
    int product = 1;
    Node current = head;
    while (current != null) {
        product *= current.value;
        current = current.next;
    }
    return product;
}

// Exercise 23
public Node reverseList(Node head) {
    Node prev = null, current = head, next = null;
    while (current != null) {
        next = current.next;
        current.next = prev;
        prev = current;
        current = next;
    }
    return prev;
}

// Exercise 24 - A
public double evaluatePolynomial(Node head) {
    System.out.print("Enter the value of x: ");
    double x = scanner.nextDouble();
    double result = 0;
    Node current = head;
    while (current != null) {
        result += current.coefficient * Math.pow(x, current.exponent);
        current = current.next;
    }
    return result;
}

// Exercise 24 - B
public Node sumPolynomials(Node poly1, Node poly2) {
    Node result = null, tail = null;
    while (poly1 != null && poly2 != null) {
        if (poly1.exponent == poly2.exponent) {
            int coeffSum = poly1.coefficient + poly2.coefficient;
            Node newNode = new Node(coeffSum, poly1.exponent);
            if (result == null) {
                result = newNode;
                tail = result;
            } else {
                tail.next = newNode;
                tail = newNode;
            }
            poly1 = poly1.next;
            poly2 = poly2.next;
        } else if (poly1.exponent > poly2.exponent) {
            Node newNode = new Node(poly1.coefficient, poly1.exponent);
            if (result == null) {
                result = newNode;
                tail = result;
            } else {
                tail.next = newNode;
                tail = newNode;
            }
            poly1 = poly1.next;
        } else {
            Node newNode = new Node(poly2.coefficient, poly2.exponent);
            if (result == null) {
                result = newNode;
                tail = result;
            } else {
                tail.next = newNode;
                tail = newNode;
            }
            poly2 = poly2.next;
        }
    }
    while (poly1 != null) {
        Node newNode = new Node(poly1.coefficient, poly1.exponent);
        if (result == null) {
            result = newNode;
            tail = result;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
        poly1 = poly1.next;
    }
    while (poly2 != null) {
        Node newNode = new Node(poly2.coefficient, poly2.exponent);
        if (result == null) {
            result = newNode;
            tail = result;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
        poly2 = poly2.next;
    }
    return result;
}

// Exercise 25
public double evaluatePolynomialReal(Node head, double x) {
    return evaluatePolynomial(head, x);
}

// Exercise 26
public Node insertListAtPosition(Node L1, Node L2, int N) {
    if (L1 == null || N <= 0) return L2;
    Node current = L1;
    int position = 1;
    while (current != null && position < N) {
        current = current.next;
        position++;
    }
    if (current == null) return L1;
    Node temp = current.next;
    current.next = L2;
    while (L2 != null && L2.next != null) {
        L2 = L2.next;
    }
    if (L2 != null) L2.next = temp;
    return L1;
}

// Exercise 28
public Node shiftElementByN(Node head, int N) {
    if (head == null || N == 0) return head;
    Node current = head;
    int count = 0;
    while (current != null && count < N - 1) {
        current = current.next;
        count++;
    }
    if (current == null || current.next == null) return head;
    Node newHead = current.next;
    current.next = current.next.next;
    newHead.next = head;
    return newHead;
}

// Exercise 28
public Node moveElementToFront(Node head, int x) {
    if (head == null || head.value == x) return head;
    Node current = head;
    while (current.next != null && current.next.value != x) {
        current = current.next;
    }
    if (current.next != null) {
        Node temp = current.next;
        current.next = current.next.next;
        temp.next = head;
        return temp;
    }
    return head;
}

// Exercise 29
public Node moveElementToPosition(Node head, int x, int N) {
    if (head == null) return head;
    if (N == 1) return moveElementToFront(head, x);
    Node current = head;
    int count = 1;
    while (current != null && current.next != null && current.next.value != x) {
        current = current.next;
        count++;
    }
    if (current.next != null) {
        Node temp = current.next;
        current.next = current.next.next;
        temp.next = null;
        Node target = head;
        for (int i = 1; i < N - 1; i++) {
            target = target.next;
        }
        temp.next = target.next;
        target.next = temp;
    }
    return head;
}

// Exercise 30
public Node unionLists(Node l1, Node l2) {
    Node result = l1;
    while (l2 != null) {
        if (!contains(result, l2.value)) {
            Node newNode = new Node(l2.value);
            newNode.next = result;
            result = newNode;
        }
        l2 = l2.next;
    }
    return result;
}

public Node intersectionLists(Node l1, Node l2) {
    Node result = null;
    while (l1 != null) {
        if (contains(l2, l1.value)) {
            Node newNode = new Node(l1.value);
            newNode.next = result;
            result = newNode;
        }
        l1 = l1.next;
    }
    return result;
}

public Node differenceLists(Node l1, Node l2) {
    Node result = null;
    while (l1 != null) {
        if (!contains(l2, l1.value)) {
            Node newNode = new Node(l1.value);
            newNode.next = result;
            result = newNode;
        }
        l1 = l1.next;
    }
    return result;
}

private boolean contains(Node head, int value) {
    Node current = head;
    while (current != null) {
        if (current.value == value) return true;
        current = current.next;
    }
    return false;
}

// Exercise 31
public def_lista initialize() {
    return null; // Returns an empty list.
}

// Exercise 31
public void insert(def_lista lista, int number) {
    def_lista newNode = new def_lista(number);
    if (lista == null) {
        lista = newNode;
        newNode.prox = newNode;
    } else {
        newNode.prox = lista.prox;
        lista.prox = newNode;
    }
}

// Exercise 31
public boolean remove(def_lista lista, int number) {
    if (lista == null) return false;
    if (lista.prox == lista) {
        lista = null;
        return true;
    }
    def_lista current = lista;
    while (current.prox != lista && current.prox.info != number) {
        current = current.prox;
    }
    if (current.prox == lista) return false;
    current.prox = current.prox.prox;
    return true;
}

// Exercise 31
public void print(def_lista lista) {
    if (lista == null) return;
    def_lista current = lista.prox;
    while (current != lista) {
        System.out.println(current.info);
        current = current.prox;
    }
    System.out.println(current.info); // Print the last element (which points to the first one).
}

// Exercise 31
public def_lista createListExcludingOdd(def_lista lista) {
    def_lista newList = null;
    def_lista current = lista.prox;
    while (current != lista) {
        if (current.info % 2 == 0) {
            insert(newList, current.info);
        }
        current = current.prox;
    }
    return newList;
}

// Exercise 32
public def_lista removeFromL1AtPositions(def_lista L1, def_lista L2) {
    def_lista current1 = L1, current2 = L2;
    int position = 1;
    while (current1 != null && current2 != null) {
        if (position == current2.info) {
            remove(L1, current1.info);
        }
        current1 = current1.prox;
        position++;
        current2 = current2.prox;
    }
    return L1;
}

// Exercise 33
public void manageNOrderedLists(int N, int[][] operations) {
    def_lista[] lists = new def_lista[N];
    for (int[] operation : operations) {
        int listIndex = operation[0];
        int value = operation[1];
    }
}

import java.util.Scanner;

public class LinkedListExercises {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        LinkedListExercises exercises = new LinkedListExercises();
        
        int choice;

        do {
            System.out.println("Menu:");
            System.out.println("0 - Leave");
            System.out.println("1 - Count Circular List Nodes");
            System.out.println("2 - Count Occurrences");
            System.out.println("3 - Count Greater Than X in Circular List");
            System.out.println("4 - Count Less Than X with Descriptor");
            System.out.println("5 - Split List into Odd and Even");
            System.out.println("6 - Split List Less Than/Greater Than X");
            System.out.println("7 - Replace X with Y");
            System.out.println("8 - Remove Element from List");
            System.out.println("9 - Count Insertions and Deletions");
            System.out.println("10 - Get First Node");
            System.out.println("11 - Get Last Node");
            System.out.println("12 - Get Last Node Pointer");
            System.out.println("13 - Insert After N-th Element");
            System.out.println("14 - Insert Before N-th Element");
            System.out.println("15 - Remove N-th Element");
            System.out.println("16 - Merge Sorted Lists");
            System.out.println("17 - Interlace Lists");
            System.out.println("18 - Concatenate Lists");
            System.out.println("19 - Copy List");
            System.out.println("20 - Check if Lists are Identical");
            System.out.println("21 - Sum of List");
            System.out.println("22 - Product of List");
            System.out.println("23 - Reverse List");
            System.out.println("24 - Polynomial Operations");
            System.out.println("25 - Evaluate Polynomial Real");
            System.out.println("26 - Insert List at Position N");
            System.out.println("27 - Shift Element by N");
            System.out.println("28 - Move Element to Front");
            System.out.println("29 - Move Element to Position N");
            System.out.println("30 - Set Operations on Lists");
            System.out.println("31 - Circular Linked List Operations");
            System.out.println("32 - Remove from L1 at Positions in L2");
            System.out.println("33 - Manage N Ordered Lists");

            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 0:
                    System.out.println("Exiting the program...");
                    break;
                case 1:
                    exercises.countCircularListNodes(null);
                    break;
                case 2:
                    exercises.countOccurrences(null, 0);
                    break;
                case 3:
                    exercises.countGreaterThanXCircular(null, 0);
                    break;
                case 4:
                    exercises.countLessThanXWithDescriptor(null, 0);
                    break;
                case 5:
                    exercises.splitOddEven(null);
                    break;
                case 6:
                    exercises.splitLessGreaterThanX(null, 0);
                    break;
                case 7:
                    exercises.replaceXWithY(null, 0, 0);
                    break;
                case 8:
                    exercises.removeElement(null, 0);
                    break;
                case 9:
                    exercises.countOperations(null, true);
                    break;
                case 10:
                    exercises.getFirstNode(null);
                    break;
                case 11:
                    exercises.getLastNode(null);
                    break;
                case 12:
                    exercises.getLastNodePointer(null);
                    break;
                case 13:
                    exercises.insertAfterNth(null, 0, 0);
                    break;
                case 14:
                    exercises.insertBeforeNth(null, 0, 0);
                    break;
                case 15:
                    exercises.removeNth(null, 0);
                    break;
                case 16:
                    exercises.mergeSortedLists(null, null);
                    break;
                case 17:
                    exercises.interlaceLists(null, null);
                    break;
                case 18:
                    exercises.concatenateLists(null, null);
                    break;
                case 19:
                    exercises.copyList(null);
                    break;
                case 20:
                    exercises.areListsIdentical(null, null);
                    break;
                case 21:
                    exercises.sumList(null);
                    break;
                case 22:
                    exercises.productList(null);
                    break;
                case 23:
                    exercises.reverseList(null);
                    break;
                case 24:
                    exercises.evaluatePolynomial(null, 0);
                    break;
                case 25:
                    exercises.evaluatePolynomialReal(null, 0);
                    break;
                case 26:
                    exercises.insertListAtPosition(null, null, 0);
                    break;
                case 27:
                    exercises.shiftElementByN(null, 0);
                    break;
                case 28:
                    exercises.moveElementToFront(null, 0);
                    break;
                case 29:
                    exercises.moveElementToPosition(null, 0, 0);
                    break;
                case 30:
                    exercises.unionLists(null, null);
                    break;
                case 31:
                    exercises.print(null);
                    break;
                case 32:
                    exercises.removeFromL1AtPositions(null, null);
                    break;
                case 33:
                    exercises.manageNOrderedLists(0, new int[][]{});
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }

        } while (choice != 0);

        scanner.close();
    }
}
