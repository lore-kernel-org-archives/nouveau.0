From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 35514] Black screen with nouveau on a GeForce
 8600M GT, either LiveCD or fresh install
Date: Wed, 23 Mar 2011 21:26:19 -0000
Message-ID: <op.vste542a7cbmmg@emo>
References: <bug-35514-8800@http.bugs.freedesktop.org/>
	<20110321182844.11F1913000C@annarchy.freedesktop.org>
	<op.vsplm4db7cbmmg@emo>
	<AANLkTinMnzvz8UTparZOeXKQ=4mnC5JShKJJtBUV=vs7@mail.gmail.com>
	<op.vspl47xf7cbmmg@emo>
	<AANLkTimt9j-YrnTwmFWchpawJbTFxd058zN0SeS_aqDh@mail.gmail.com>
	<op.vspmtqy27cbmmg@emo>
	<AANLkTi=xtccAqd-3kZNfqAf7bL3RmWqC7_YQyx+N6k3i@mail.gmail.com>
	<AANLkTinwdxFuDrKzH7siWjiNkaFzVUD3gau-zWGBZv8D@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinwdxFuDrKzH7siWjiNkaFzVUD3gau-zWGBZv8D-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathieu Marquer <mathieu.marquer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Your dmesg looks fine (apart from "DCB encoder 1 unknown")
Can you try forcing another resolution as mentioned before, see
ForceModes [1]

[1] http://nouveau.freedesktop.org/wiki/KernelModeSetting
