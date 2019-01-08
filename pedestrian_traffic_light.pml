mtype = { red, green };

mtype light_colour;
byte number_of_pedestrian;

proctype LogicUnit() {
    end_logic_unit: do
    :: atomic{
        if
        :: atomic {
            number_of_pedestrian > 5 ->
            printf("light is green\n");
            light_colour = green;
        }
        ::  atomic {
            else ->
            printf("light is red\n");
            light_colour = red;
        }
        fi
    }
    od
}

proctype Sensor() {
    end_sensor: do
    :: atomic{
        light_colour == red ->
        // printf("n = %d\n", number_of_pedestrian);
        if
        :: true -> number_of_pedestrian = number_of_pedestrian + 1;
        :: true -> number_of_pedestrian = number_of_pedestrian;
        fi
    }
    :: atomic{
        light_colour == green ->
        // printf("n = %d\n", number_of_pedestrian);
        number_of_pedestrian = 0;
    }
    /* :: atomic{
        else ->
        printf("n = %d\n", number_of_pedestrian);
        skip;
    }*/
    od
}

init {
    number_of_pedestrian == 0;
    light_colour = red;
    atomic{
        run LogicUnit();
        run Sensor()
    }
}


ltl c1 { [](light_colour == green -> (light_colour == green U number_of_pedestrian == 0)) }
ltl c2 { [](number_of_pedestrian > 0 -> (number_of_pedestrian > 0 U light_colour == green)) }
