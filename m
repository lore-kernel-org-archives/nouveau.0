From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: GtkPerf: Non linear Add text execution time
Date: Fri, 12 Mar 2010 14:20:07 +0100
Message-ID: <4B9A3F87.1080203@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello everyone,

I am a daily tester of the nouveau driver on my (nVidia Corporation 
Quadro NVS 140M (rev a1)).

Today, when trying to make compiz crash, I have tried to execute a lot 
of tests at the same time with both 2D and 3D. Well, I didn't bump into 
any crashes but I have discovered a really annoying performance issue.

Indeed, the gtkTextView - Add Text of gtkperf has non-linear execution 
times:

GtkPerf 0.40 - Starting testing: Fri Mar 12 13:57:19 2010

GtkTextView - Add text - time:  0,03 --> 10 executions
  ---
Total time:  0,04

GtkPerf 0.40 - Starting testing: Fri Mar 12 13:57:28 2010

GtkTextView - Add text - time:  0,99  --> 100 executions
  ---
Total time:  0,99

GtkPerf 0.40 - Starting testing: Fri Mar 12 13:57:34 2010

GtkTextView - Add text - time: 88,19 --> 1000 executions
  ---
Total time: 88,19

So, if results were linear, we would have had a 3 seconds execution time 
with 1000 executions while we got 88.19s.

Just to give you an idea. I was testing with even more iterations and 
adding just one single text can take more than one second.

I don't know if it is a performance regression or if it has always been 
here but this could explain some slow code-path I sometime encounter 
using nouveau on lengthy webpages.

What do you think about it ?

Also, one last question, do you have any idea why KWin doesn't let me 
activate the composite. Do you think the problem is from KWin or does 
Nouveau misses a few features to get it working ?

Anyway, I am an happy tester of the nouveau stack and I would be glad to 
help you in running tests/applying patches on my card.

Martin
