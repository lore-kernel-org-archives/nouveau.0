From: Mourad De Clerck <mourad-mfMr2rENS1xBDgjK7y7TUQ@public.gmane.org>
Subject: NVAF feedback
Date: Thu, 28 Oct 2010 17:36:35 +0200
Message-ID: <4CC99883.4040808@aquazul.com>
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
To: =?UTF-8?B?TWFyY2luIEtvxZtjaWVsbmlja2k=?= <koriakin-mP9o5jsk0RY@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,

I noticed a patch in drm-core-next that would add NVAF support:

e69b4418825c2e4c6563ae1d69bd75377826e263
drm/nv50: demagic grctx, and add NVAF support

So I decided to try it out on my MacbookPro7,1 (13" MBP).

I can report that Xorg starts up, and everything is OK according to the
Xorg log. However, the screen is somewhat corrupted (background images
and windows are drawn, foreground text and images are not), and the
dmesg spews a lot of these:

[drm] nouveau 0000:04:00.0: PGRAPH_ILLEGAL_MTHD - Ch 2/5 Class 0x8597
Mthd 0x1340 Data 0x00000000:0x00008006
[drm] nouveau 0000:04:00.0: PGRAPH_ILLEGAL_CLASS - Ch 2/5 Class 0x8597
Mthd 0x1340 Data 0x00000000:0x00008006
nouveau_ratelimit: 2520 callbacks suppressed

Just thought I'd report it. Thanks for your work.

-- M
