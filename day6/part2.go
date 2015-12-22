package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
)

func readInput() ([]string, error) {
	file, err := os.Open("input")
	if err != nil {
		return nil, err
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines, scanner.Err()
}

func main() {
	input, err := readInput()
	if err != nil {
		log.Fatalf("Can't read input %s", err)
		panic(err)
	}

	// grid of lights
	grid := make([][]int, 1000)
	for x := 0; x < 1000; x++ {
		grid[x] = make([]int, 1000)
	}

	// some test values
	// input = []string{
	// 	"turn on 0,0 through 0,0",
	// 	"toggle 0,0 through 999,999",
	// 	// "turn off 499,499 to 500,500",
	// }
	r, _ := regexp.Compile(`^(.+)\s(\d+),(\d+)\s.+\s(\d+),(\d+)$`)
	for _, action := range input {
		match := r.FindAllStringSubmatch(action, -1)[0] // we assume it alwyas match
		fromX, _ := strconv.Atoi(match[2])              // and that we an convert to int
		fromY, _ := strconv.Atoi(match[3])
		toX, _ := strconv.Atoi(match[4])
		toY, _ := strconv.Atoi(match[5])

		// log.Printf("%d %d %d %d", fromX, fromY, toX, toY)

		// ugly.. should refactor
		switch match[1] {
		case "turn on":
			for x := fromX; x <= toX; x++ {
				for y := fromY; y <= toY; y++ {
					grid[x][y]++
				}
			}
		case "turn off":
			for x := fromX; x <= toX; x++ {
				for y := fromY; y <= toY; y++ {
					grid[x][y]--
					if grid[x][y] < 0 {
						grid[x][y] = 0
					}
				}
			}
		case "toggle":
			for x := fromX; x <= toX; x++ {
				for y := fromY; y <= toY; y++ {
					grid[x][y] += 2
				}
			}
		default:
			log.Fatalf("Invalid action: %s", action)
		}
		// return
	}
	count := 0
	for _, x := range grid {
		for _, y := range x {
			count += y
		}
	}
	fmt.Printf("Total brightness %d\n", count)
}
