# Presentation Script

---

Ask Tiago:

- [ ] Here do I mention the paper name?
- [ ] Video não é vídeo, posso colocar?
- [ ] És tu quem fala durante o vídeo?
- [ ] Na parte dos agents não estamos a falar propriamente dos MR, MM, QR e QQ, mas sim das policies
- [ ] Explicas o que é a termination rule?

---

## Slide 1: Title Slide

Hey, my name is Ana and this is my colleague Tiago and today we are going to present our [WHAT??? - Reproducing Minimax-Q and Q-Learning in Markov Games] a reproduction of Littman’s 1994 paper.

## Slide 2: Roadmap

For this presentation, we will do a little recap of what is our project about, then we will present the results that we obtained, after that we will talk about the expanded enviroment that we created and finally we will conclude with the demostration video.

## Slide 3: Environment

This is a competitive two-player grid-world game with a 4 by 5 grid (just like this one) that represents a simplified futball match.

At every step of the game, each player, agent A and B, can choose from five possible actions: north, south, east, west, or stay. For clarity and better alignment with common grid conventions, we renamed these to up, down, left, right, and stay, allowing us to refer to each action by its initial without confusion.

The game starts with both agents placed in fixed positions, and one of them randomly assigned possession of the ball. The goal is to score by bringing the ball into the opponent’s goal, which is located at the far-left column for Agent A, and the far-right column for Agent B.
Note that a player must have possession of the ball to score, just reaching the goal line without the ball doesn’t result in a point.

If a player tries to enter their own goal, Littman’s paper didn’t specify what happens, so we assumed that the agent stays in place and no goal is scored, as if that agent was trying to leave the field.

Each game ends immediately when a goal is scored. The scoring agent receives a reward of +1, and the opponent gets -1. All other transitions provide zero reward, and the environment resets after each goal.

The changing possession of the ball is a key aspect of the game and it happends when both agents try to move into the same square.

Both agents choose their actions simultaneously, but the environment resolves their actions in a random order. If the agent with the ball tries to move into a square occupied by the other agent, the ball is lost, and possession switches to the stationary player.

This means that the result of certain interactions can vary depending on the order in which moves are applied.

Now that we have explained the environment, let’s talk about the agents that we trained to play this game.

## Slide 4: Agents

To reproduce the agents from Littman’s original paper, we implemented several different policies.

The first one, a Random Policy is the most basic agent. It selects one of the five possible actions completely at random at every step and it doesn’t learn from the environment.

Next, we implemented two hand-built policies. Since Littman didn’t publish code for the original hand-built policy we choose to start implementing The Secure Hand-Built Policy version witch is designed to be highly conservative and defensive. It protects its goal when it's not in possession of the ball and attacks only when it sees an opening. Against the Random agent, it achieved a 99% win rate in 100,000 steps.
The second hand-built policy it's slightly more dumb because was derived from the secure version but intentionally make some less optimal choices by adding some randomness. However, even this agent won 99% of its games against a random opponent, showing how far a structured policy can go even without learning.

Going to the learning agents, the Q-Learning Policy agent uses classical Q-learning, trained for 1 million steps with parameters specified in Littman’s paper. We used this agent both for reproducing the results from the paper and for training our Challenger agents later on.

Finally, we implemented the Minimax-Q agent as described in Littman’s article. Unlike standard Q-learning, this agent computes a minimax solution during updates by solving a linear program. The goal is to find the optimal stochastic policy assuming a worst-case opponent, making it more strategic and robust against other agents. _We trained this agent for 1 million steps, using the same parameters as Littman’s original implementation._

In addition to the agents we’ve already discussed, we also developed a set of Challenger agents. These agents were designed and trained specifically to compete with and test the robustness of the previously implemented policies. They were trained the same way as we trained the Q-Learning agent against the random opponent.

## Slide 5: MR Results (Tiago)

Following Littman’s original 1994 paper, we used three distinct testing scenarios to assess agent performance. The first against a Random Agent, which selects actions uniformly at random. The second against a Hand-Crafted Agent, in our case against two different agents. The last against a Challenger Agent, trained using Q-learning to specifically exploit the test subject. Each evaluation was carried out over 100,000 steps, and repeated three times and the results were averaged.

A subtle but important detail from Littman’s paper is the inclusion of a 10% chance of step termination. However, the original article is not clear on whether this rule was applied across all scenarios or just the random opponent test. We explored both interpretations.

Finally, each challenger test was repeated three times, just like in Littman’s setup, but only the first result is shown, because the other results were similar.

Against a random opponent, our reproduced win rate was 99.2%, which is nearly identical to Littman’s reported 99.3%. Both results were based on around 6400–6500 completed games when the termination rule was active. This suggests our implementation of Minimax-Q closely aligns with the original formulation. Against hand-built without the termination rule, MR achieved 49.6% and 48.3% win rates, remarkably close to Littman’s 48.1% benchmark. When the termination rule is enabled, win rates decreased slightly to 46.2% and 46.4%. However, things change significantly in the challenger test. Littman reported a 35% win rate here. But our reproduced results were noticeably lower. Just 24.6% without the termination rule and only 29.8% even with the rule applied. This is a substantial deviation despite using identical training parameters. However, we’re confident in our implementation, because the performance of other Q-learning-based agents, like QR and QQ, remains consistent with Littman’s findings, as we’ll see shortly.

## Slide 6: MM Results (Tiago)

First, against a random opponent, our MM agent achieved a 99.3% win rate over 7700 games, perfectly matching Littman’s reported performance of 99.3% over 7200 games. This again validates the correctness of our reproduction. In matches against the hand-built policy, our agent performed similarly to Littman’s in terms of win rate, but the amount of games is a bit different. This is probably because our policies are riskier than the one from Littman’s, resulting in faster terminations. Once again, the challenger test reveals the largest gap. The difference here is hard to explain. We used identical parameters and validated the core algorithm across all other tests. The variation might be due to how the challenger adapts to nuances in policy dynamics during training.

## Slide 7: QR Results (Tiago)

First, against the random policy, our agent performed exactly as expected. Achieved a 99.4% win rate over 11,300 games with the termination rule active. This perfectly matches Littman’s reported results, both in win rate and number of completed games—an encouraging confirmation of our implementation’s correctness. When tested against more structured policies like the hand-built agents, performance dropped substantially. Win rates were around 24.8%–25.0% without the rule, and 25.9%–25.4% with it. These results are very close to Littman’s reported 26.1%. The biggest surprise comes in the test against the QR-challenger. Littman reported a 0% win rate here, complete domination by the challenger. In contrast, our QR agent achieved a 25.1% win rate. This discrepancy is hard to understand. We strictly followed the settings outlined in Littman’s paper for both the QR agent and its challenger.

## Slide 8: QQ Results (Tiago)

Against the random opponent, performance was strong again. Against the hand-built agents, however, things diverged. Our agent’s win rate hovered around 50–51%, regardless of the termination rule. Littman reported 76.3%, a much higher figure that suggests a more dominant policy than what we observed. This time, the fact that both our hand-built policies were riskier than Littman’s influence in the win rate. Against the QQ-challenger, both Littman’s and our agent had a 0% win rate, confirming the QQ-challenger is indeed effective at exploiting the QQ agent it was trained against. With the termination rule, the number of completed games in our experiment closely matched Littman’s. Without the termination rule, no games were completed in our case, likely due to agents falling into cyclic or indecisive behaviors that prevent reaching a terminal state.

## Slide 9: Expanded Environment

In addition to reproducing Littman’s original setup on the by 4 by 5 grid, we extended our experiments to a larger 6 by 10 grid, where agents were trained and evaluated from scratch within this new environment. _In all tests on the expanded field, we enabled the termination rule, as it produced results that were more consistent with those reported in Littman’s original work._

Against the random opponent, all agents maintained high win rates, demonstrating that the learning algorithms remained effective even as the state space and spatial complexity increased. These results suggest that, despite the added environmental complexity, the agents were able to learn competent policies that reliably exploited the random opponent’s lack of structure.

**Performance against the hand-built agents dropped significantly across all agent types. This outcome is expected, as the hand-crafted policies were originally designed for the 4×5 field.** -> bro isto não diz nada

The most interesting results emerged from the tests against the challenger agents. Although overall win rates against challengers remained low, the relative ordering of agent robustness observed in Littman’s original study persisted. QR and QQ were still the most vulnerable, with both exhibiting 0% win rates against their respective challengers. MR performed slightly better, and MM again proved to be the most resilient to adversarial exploitation. This consistency in relative performance suggests that the structural advantages and limitations of each algorithm persist even in larger, more complex environments.

Interestingly, in this expanded setting, the QR-challenger not only held the QR agent to a draw but was able to defeat it, a difference from the original 4×5 field, where games between these agents often became interminable due to repetitive or indecisive behavior. The increased field size appears to introduce new spatial and strategic dynamics that allow more sophisticated opponents to better expose the limitations of simpler Q-learning policies. In this way, the larger field not only challenges the agents’ ability to learn effective strategies but also provides a more revealing testbed for understanding their vulnerabilities.

## Slide 10: Video Demonstration

While we were able to replicate the overall experimental framework and approximate many of Littman’s reported results, several notable discrepancies emerged.

One of the primary challenges came when evaluating agents against their respective challengers. Despite faithfully reproducing the experimental parameters, the outcomes in these adversarial matchups often diverged from those reported by Littman. For instance, our MR agent performed significantly worse against the MR-challenger than expected, despite exhibiting near-identical performance in the other tests. Conversely, our MM agent outperformed Littman’s reported results against the MM-challenger when the termination rule was enabled.
Another interpretational difficulty involved the 10% chance of termination rule. The original paper does not clearly specify whether games that terminated due to this rule were included in the reported performance statistics. In most cases, having this rule enabled led to results more closely aligned with Littman’s. However, exceptions exist: for example, in the MM agent's evaluation against hand-built opponents, not having the termination rule led to greater proximity to Littman’s outcomes.
When expanding the original experimental design to include a larger, 6×10 soccer field, the relative ordering of agent robustness remained consistent with Littman’s findings: the QR and QQ agents were the most susceptible to exploitation, while MR and especially MM retained greater resilience against their respective challengers.

Another anomaly in our study concerns Littman’s reported performance of the QQ agent against the hand-built policy. While Littman cited a 76.3% win rate, we were unable to reproduce anything close to this level of success. This raises questions about the original result’s reliability. Littman himself acknowledged surprise at his outcome.

## Slide 11: Conclusion

Any questions?
