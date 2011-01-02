From: Chriss Kalogeropoulos <iz.iznogood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau crashes on startup
Date: Sun, 02 Jan 2011 20:06:03 +0200
Message-ID: <1293991563.2656.16.camel@chriss-iMac>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

hi everybody,

i have a problem with the latest kernel and nouveau driver and i would
appreciate any assistance.

My setup is an 24'' core duo 2 iMac,4 gb ram and an nvidia 7600 card.
I use the 10.10 ubuntu (64 bit). Nouveau was working amazingly well with
all the latest ubuntu versions even after enabling experimental 3d.

A few months ago i managed to fry the card  (probably by running some
benchmark for cairo-perf). This happened during the 10.04 ubuntu
version. After the first reboot, i got garbage on the screen and i
though that the card should be replaced. 

To my surprise, the system managed to start with the following message :
"nouveau gpu lockup, switching to software fbcon". After that i had no
problems using the software accelerated driver and i also had some
opengl acceleration.

With 2.6.36 and 2.6.37 drivers, the system cannot fall back to the fbcon
but displays garbage and freezes before X can display anything. 

Is  there anything i can do to go back to the old behavior with the
latest kernels ? is there any kind of log or info to post that might
help resolve the issue ? 

please cc me since i am not on the list

Thanks in advance
