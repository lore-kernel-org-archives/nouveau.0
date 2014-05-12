From: Sid Boyce <sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org>
Subject: Re: Problem with kernels 3.15.0-rc and GF114 [GeForce,
 GTX 560 Ti] (rev a1) **FIXED**
Date: Mon, 12 May 2014 01:26:28 +0100
Message-ID: <53701534.1040200@blueyonder.co.uk>
References: <mailman.1903.1399051042.25987.nouveau@lists.freedesktop.org>
Reply-To: sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <mailman.1903.1399051042.25987.nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Whatever the problem was, kernel 3.15.0-rc5 fixed it.
I am not in a position to do a git bisect at present.
Regards
Sid.

On 02/05/14 18:17, nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org wrote:
> Subject: [Nouveau] Problem with kernels 3.15.0-rc and GF114 [GeForce
> 	GTX 560 Ti] (rev a1)
> Message-ID:<53638FA1.6020200-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org>
> Content-Type: text/plain; charset=ISO-8859-1; format=flowed
>
> On the slipstream box I have no problems with 3.14.0 kernel.
> With 3.15.0-rc kernels, in KDE some applications fail to start - e.g
> kmix, some like thunderbird come up but are not usable, e.g clicking to
> display a message text, nothing happens and sometimes screens won't switch.
> slipstream:~ # lspci
> 01:00.0 VGA compatible controller: NVIDIA Corporation GF114 [GeForce GTX
> 560 Ti] (rev a1)
> slipstream:~ # uname -r
> 3.14.0-smp+
>
> On the 2 other systems with the same openSUSE 13.2 Milestone 0 distro
> and identical software levels and packages but different video cards
> there is no problem - both up and running on vanilla kernel 3.15.0-rc3
> since Monday.
> sabre:~ # lspci
> 01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600
> GT] (rev a1)
> sabre:~ # uname -r
> 3.15.0-rc3-smp+
>
> tindog:~ # lspci
> 01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForce GT
> 610] (rev a1)
> tindog:~ # uname -r
> 3.15.0-rc3-smp+
>
> On all systems the kernel config is identical.
> Regards
> Sid.


-- 
Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks
