From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: SERIALIZE command
Date: Fri, 9 Apr 2010 23:56:54 +0900
Message-ID: <000c01cad7f4$e7d0e6e0$b772b4a0$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: ja
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

Hi all,

I am trying to use the 0x110 SERIALIZE (or 0x108 WAIT_FOR_IDLE?) command to
barrier the PGRAPH commands.
Unfortunately, I do not find any examples either in nouveau or gallium.

If it plays just a barrier, I guess it should work by something like (in
case of m2mf):
BEGIN_RING(chan, m2mf, 0x110, 1);
OUT_RING(chan, 1);

Otherwise, it may actually play to serialize some commands, then I would
rather use as follows:
BEGIN_RING(chan, m2mf, 0x110, 1);
OUT_RING(chan, NUMBER_OF_FOLLOWING_COMMANDS);

I have tried both approaches, and the application runs without any problems,
but I am not sure if barriers have happened or not ;-)
I would appreciate if anyone can tell me how to use the barrier command.

Best,
- Shinpei
