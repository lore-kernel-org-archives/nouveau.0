From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: System fails to boot w/o boot option "nomodeset"
Date: Thu, 10 Apr 2014 00:24:28 -0400
Message-ID: <CAKb7Uvh3K1zYywK5Mg9PE-ZKveGHLSNPZ0ZdbH1jf=VJ-Gr73Q@mail.gmail.com>
References: <trinity-86077d40-e48f-4074-96c6-9f447a8fd650-1396971645493@3capp-webde-bs12>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <trinity-86077d40-e48f-4074-96c6-9f447a8fd650-1396971645493@3capp-webde-bs12>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Schneider <c.monty-S0/GAf8tV78@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Apr 8, 2014 at 11:40 AM, Thomas Schneider <c.monty-S0/GAf8tV78@public.gmane.org> wrote:
> Hello!
>
> I'm using rather old hardware:
> Mainboard (Asus A7N8X)
> AGP (Asus V7700)
>
> manfred@pc1:~$ lspci -v | grep VGA
> 03:00.0 VGA compatible controller: NVIDIA Corporation NV15 [GeForce2
> GTS/Pro] (rev a3) (prog-if 00 [VGA controller])
>
> My operating system is SolydX based on Debian Testing.
>
> The issue is that I cannot start the system w/o boot option "nomodeset".

Using nomodeset disables nouveau entirely, so you won't be able to use
the 'nouveau' ddx either. It'd probably work with vesa or something.

Things to try:

nouveau.noaccel=1
nouveau.agpmode=0

(also in combination)

Did this system ever work? Any indication that the hardware isn't
terminally busted?

> I get this information after displaying Grub menu:
>
> Linux 3.11-2-486 wird geladen ...
> Initiale Ramdisk wird geladen ...
>
> Loading, please wait ...
>
>
> Then the system is freezing and I need to hard reset.

If you boot without the quiet option it should make it much more
apparent where things are going wrong.

  -ilia
