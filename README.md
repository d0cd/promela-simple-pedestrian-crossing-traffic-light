Consider a pedestrian crossing traffic light that has a weight sensor and a simple logic unit, both working on the same CPU. The traffic light has two possible colors: red and green. The system works as follows:

* The logic unit receives the number of pedestrians currently waiting from the sensor. If there are more than 5 people waiting, the light turns to green. Otherwise, the light remains red. The color is in turn sent to the sensor.
* The sensor receives the light color from the logic unit and sends the number of waiting pedestrians to it. If the light is green, the pedestrians cross the street. Otherwise, the number of pedestrians will remain the same or increase.

Model the system using SPIN, and check the following properties:
* If the light is green, it will remain so until there are no pedestrians waiting.
* In case there are waiting pedestrians present, they will continue to wait until the light is green.
