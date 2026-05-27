module traffic_light (
    input clk,
    input rst,
    output reg [2:0] light_A,
    output reg [2:0] light_B
);

    reg [1:0] S;
    reg [3:0] counter;

    parameter Red    = 3'b100,
              Green  = 3'b010,
              Yellow = 3'b001;

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    parameter Green_time  = 10;
    parameter Yellow_time = 3;

    always @(posedge clk) begin

        counter <= counter + 1;

        if (rst) begin
            S       <= S0;
            counter <= 4'd0;
        end

        else begin

            case (S)

                S0 : begin

                    if (counter == Green_time) begin
                        counter <= 0;
                        S       <= S1;
                    end

                end

                S1 : begin

                    if (counter == Yellow_time) begin
                        counter <= 0;
                        S       <= S2;
                    end

                end

                S2 : begin

                    if (counter == Green_time) begin
                        counter <= 0;
                        S       <= S3;
                    end

                end

                S3 : begin

                    if (counter == Yellow_time) begin
                        counter <= 0;
                        S       <= S0;
                    end

                end

            endcase

        end

    end

    always @(*) begin

        case (S)

            S0 : begin
                light_A = Green;
                light_B = Red;
            end

            S1 : begin
                light_A = Yellow;
                light_B = Red;
            end

            S2 : begin
                light_A = Red;
                light_B = Green;
            end

            S3 : begin
                light_A = Red;
                light_B = Yellow;
            end

            default : begin
                light_A = Red;
                light_B = Red;
            end

        endcase

    end

endmodule