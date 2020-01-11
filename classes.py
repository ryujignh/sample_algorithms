# classes1 = [(0, 50), (50, 100)]
# answer1 = 1
classes2 = [(0, 50), (50, 100), (25, 75)]
answer2 = 2
# classes3 = [(10, 50), (20, 30), (60, 100), (70, 90)]
# answer3 = 2


def first(tuple):
    return tuple[0]


def solution2(classes):
    timeline = []
    for start, end in classes:
        timeline.extend([(start, True), (end, False)])
        timeline.sort(key=first)
        max_rooms = 0
        rooms = 0
        for _, is_start in timeline:
            rooms += 1 if is_start else - 1
            max_rooms = max(max_rooms, rooms)
        return max_rooms


# assert solution2(classes1) == answer1
assert solution2(classes2) == answer2
# assert solution2(classes3) == answer3
print("Good")