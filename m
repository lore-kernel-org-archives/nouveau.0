From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: Implement reclocking for DDR2, DDR3, GDDR3
Date: Mon, 29 Sep 2014 19:27:12 +0200
Message-ID: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Following a series of patches that implement memory reclocking for NVA3/5/8 with
DDR2, DDR3 and GDDR3 on board. I tested these patches on 6 different graphics
cards, but I expect reclocking now to work on many more.
Testers can pick up these patches and test it by enabling pstate
(nouveau.pstate=1). They should then be able to change clocks by writing to
/sys/class/drm/card0/device/pstate. Correct values can be read from this sysfs
node. Note that this API is likely to change in the future, hence it's hidden
behind this kernel parameter.

What works:
- Reclocking on many DDR2, DDR3 and GDDR3 cards, both up and down
- Doing so "invisibly", eg no black screens

What still needs fixing:
- GDDR5. There's non-reclocking related issues with GDDR5 cards in this family.
Sorry, Michael..
- Link training is only done for a single partition, because I haven't seen
cards that require training on multiple partitions. If you have one, contact me.
- Stability. Sometimes reclocking (esp. in a tight loop) fails and the machine
hangs. Reboot and you're fine. Just up'ing the clocks before gaming and bringing
them back afterwards should not cause serious issues and once the clocks are
changed it's as stable as it was before.
- DDR3 cards that require training will give a black screen on the first
reclock. When stability improves, we might hide this black screen in the
boot process, but not until we're absolutely certain that this can not lead
to hangs or crashes on boot.
- Some DDR2 cards give corruption in the highest performance level, which dis-
appears when clocking back. I suspect this is caused by insufficient bandwidth
between the memory and the graphics processor, but I don't have an answer as to
why bandwidth is insufficient.
- Automatic frequency scaling. Not before the other issues have been resolved.

Please review, and happy testing!

Roy
