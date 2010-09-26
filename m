From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems with the driver
Date: Sun, 26 Sep 2010 16:46:20 +0200
Message-ID: <AANLkTi=2ioaP97oNarmPUwLY0vO2JX5=j+WTUDw_bCN9@mail.gmail.com>
References: <4C9F54F2.1010108@example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C9F54F2.1010108-hcDgGtZH8xNBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: piotr-aAmyfUXO971Wk0Htik3J/w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2010/9/26 Piotr Hosowicz <piotr-aAmyfUXO971Wk0Htik3J/w@public.gmane.org>:
> Hello,
>
> I can build the driver, it loads, but it does not work. Please find attached
> my local data, sorry for the form, I made it a few days ago and would have
> to build a new kernel which would also not work. My card is 01:00.0 VGA
> compatible controller: nVidia Corporation G96 [GeForce 9400 GT] (rev a1).
> The things stay the same, never mind how I try.
>
> Please CC me, as I am not in the group.
>

Your Xorg.0.log file shows that NVIDIA proprietary driver is still installed.
Try to uninstall it until you no longer see any mention of NVIDIA in Xorg.0.log
