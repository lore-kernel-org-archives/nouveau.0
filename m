From: Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org>
Subject: Re: where to report modesetting DDX bug?
Date: Sat, 29 Feb 2020 06:53:43 -0500
Message-ID: <e3ee704c-9a2f-5e68-2e24-bb55c8ae8cb8@earthlink.net>
References: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
 <CAKb7Uvg9RhCvRs+WU-0RdYc0SXMA-pXyppk5g7MF6b-MzPVUHg@mail.gmail.com>
 <8d8fc2fb-13f2-afb7-f542-d6f7983df059@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8d8fc2fb-13f2-afb7-f542-d6f7983df059-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Felix Miata composed on 2020-02-28 12:38 (UTC-0500):

>> Felix Miata wrote in https://lists.freedesktop.org/archives/nouveau/2020-February/035583.html:

> 	OS	Kernel		State	/boot/vmlinuz timestamp
>>> openSUSE 15.1/kernel 4.12.14    OK	2019-12-06
> Fedora 31/5.3.16 kernel		OK	2019-12-13
> openSUSE 15.2/5.3.16 kernel	OK	2019-12-31
> Tumbleweed/5.4.7 kernel		OK	2020-01-08
> Mageia 7/5.4.10 kernel		OK	2020-01-09
> Mageia 8/5.4.11 kernel		OK	2020-01-13
>>> Debian Buster/kernel 4.19.x     OK	2020-01-26
>>> Tumbleweed/kernel 5.4.14        bad	2020-02-02
> Fedora 31/5.4.20 kernel		OK	2020-02-17
> Fedora 30/5.4.21 kernel		OK	2020-02-19
>>> Fedora 31/5.5.5 kernel          bad	2020-02-19
>>> openSUSE 15.2/kernel 5.3.18     bad	2020-02-21

> Does this expanded timeline help any?

Apparently I put blame in the wrong place. I just tried a Display-Port to HDMI
adapter on a Radeon HD 3470 GPU and got the same failure.

https://gitlab.freedesktop.org/xorg/xserver/issues/992 reported.
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
