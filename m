From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: crtc not turned off after X shutdown?
Date: Fri, 21 Mar 2014 09:29:41 -0400
Message-ID: <CAKb7UviBpe_wExhPyGTHfunoZb_Yfg4hNpqA9N+PxdrM1HaJKA@mail.gmail.com>
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
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I've been seeing an issue, for a while now, but kept forgetting to
mention it. When I have 2 cards plugged in (and runpm=0), and I run X
on the second card, everything works fine. However, when I shut X
down, the last image remains, and the attached screen never suspends.
I've seen this esp happen on pre-nv50 cards, although it might happen
on nv50+ as well (it's just not a setup I've used too often).

A potentially related issue is that when I have 2 instances of X
running on separate cards (and on separate vt's), switching between
vt7 and vt8 does not cause the opposite card to stop showing an image.
However the cursor disappears (and appears on the switched-to card).

Hopefully I've been clear in describing the issue. How KMS ties into
vt's/etc is an area I haven't explored at all, so perhaps this is
expected.

  -ilia
