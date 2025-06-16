# Presentation Script

## Slide 1: Title Slide

Hey, my name is Ana and this is my colleague Tiago and today we are going to present our [WHAT??? - Reproducing Minimax-Q and Q-Learning in Markov Games] a reproduction of Littman’s 1994 paper.

## Slide 2: Roadmap

For this presentation, we will do a little recap of what is our project about, then we will present the results that we obtained, after that we will talk about the expanded enviroment that we created and finally we will conclude with the demostration video.

## Slide 3: Environment

This is a competitive game were 2 agents A and B tries to reach the goal in a simplified version of football in a 4 by 5 grid.

In every round of the game each player must choose one of the five actions: go up, go down, go left, go right or stay still but the order in witch the players execute their actions is random.
Each game ends when a player with the ball enters in their goal cells, which are located in the far-left column of the grid, for player A, and in the far-right column of the grid, for player B.

As is not specified in the Littman’s paper, we assume that, just like when the a player tries to leave the grid, when a player tries to enter in its own goal cell or in the opponent's goal cell but without the ball, the player stays still in the same cell.

Speaking in having the ball, at the beginning of the game, the ball is randomly assigned to one of the players. A player loses the ball when tries to enter in the same cell as the opponent. Remind that the players actions are chosen simultaneously but the order in which they are executed is random witch means that the result of certain actions varies depending on the order in which they are executed.

When a goal is scored, a reward of +1 is given to the player who scored the goal, a reward of -1 is given to the opponent and the game resets to the initial state.

## Slide 4: Agents

Now let's talk about the agents.

The first one, follows a Random Policy and it's the most basic agent once it chooses its actions randomly, without learning anything from the environment.

The second one follows a Hand-Built Policy Since Littman’s paper does not specify their hand-built policy, we choose to start implementing a Secure Hand-Built Policy, which is design to be a very defensive policy.It protects its goal when it's not in possession of the ball and attacks only when it sees an opportunity to score a goal.

We also created a slighty more dumb Hand-Built Policy, that it's very similar to the Secure Hand-Built Policy but sometimes, instead of staying still, it takes a different action.

Now going to the learning agents, we trained two Q-Learning agents that follow a classical Q-Learning policy that were one was trained agains a random agent and the other agaings other Q-Learning agent, using all the parameters specified in the Littman’s paper.

Using a minimax-Q algorithm, we trained two Minimax-Q agents that also follow a classical Minimax-Q policy, one was trained against a random agent and the other against another Minimax-Q agent, using all the parameters specified in the Littman’s paper.

Finally, we trained the Challenger Agents that are agents trained another the other agents, using the same parameters as the Q-Learning agents.

## Slide 5: MR Results (Tiago)

> Tiago does the talk

## Slide 6: MM Results (Tiago)

> Tiago does the talk

## Slide 7: QR Results (Tiago)

> Tiago does the talk

## Slide 8: QQ Results (Tiago)

> Tiago does the talk

## Slide 9: Expanded Environment

> Tiago does the talk

In addition to the original environment, we also created an expanded environment that uses a 6 by 10 grid and the agents were trained from scratch using the same parameters as the original environment but in this new environment.

Agains the Random Agent the other agents maintained a high win rate but againt the Hand-Built Policies the agents winning rate was lower, which is expected since the Hand-Built Policies were designed to be very defensive.

## Slide 10: Video

Now we will show you a video of the agents playing in the original environment.

While we were able to replicated the Littman's work and get similar results, we also encountered some discrepancies.

### Challengers Results

The first challenge was when evaluating agents against their respective challengers (this are the games that are shown in the video) once, despite reproducing the experimental parameters, the results differed from those reported by Littman.

One example is our MR agent that performed worse than the expected against the MR-challenger, despite exhibiting near-identical performance in the other tests.

In the other hand, our MM agent outperformed Littman’s reported results against the MM-challenger when the termination rule was enabled.

### Termination Rule

Another challenge was exactly the use or not of the termination rule, which was not clearly specified in the original paper. We found that enabling this rule generally aligned our results more closely with Littman’s, but there were exceptions, such as the MM agent's performance against hand-built opponents.

### QQ agent

Finally, we encountered an anomaly with the QQ agent. While Littman reported a 76.3% win rate against the hand-built policy, we were unable to reproduce this result, raising questions about the reliability of the original finding. Littman himself acknowledged surprise at his outcome.

## Slide 11: Questions

Thank you for your attention. We are now open to any questions you may have about our project or the results we obtained.
