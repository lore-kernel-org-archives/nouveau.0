From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: nouveau module not loading
Date: Tue, 25 Mar 2014 07:48:54 -0400
Message-ID: <CAKb7UviyMkCLk3C5gwNBkbVAhTa5Fv-8b4tmvsdZRnewe_kuNA@mail.gmail.com>
References: <53311AC8.9050504@alust.homeunix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53311AC8.9050504-Q1PPmwm10TxD9JxaSR3mpdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexei Ustyuzhaninov <alust-Q1PPmwm10TxD9JxaSR3mpdBPR1lH4CV8@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 25, 2014 at 1:57 AM, Alexei Ustyuzhaninov
<alust-Q1PPmwm10TxD9JxaSR3mpdBPR1lH4CV8@public.gmane.org> wrote:
> Hi!
>
> I have a rather decent notebook (Toshiba Satellite P105-S9722) with Nvidia
> GeForce Go 7900 GS video card. I installed latest debian system with kernel
> 3.13-1-amd64 on it, but unfortunately nouveau driver doesn't work. When I
> load nouveau module following messages will appear in syslog:
>
> Mar 25 11:50:53 ivnb kernel: [ 2703.329287] nouveau  [ DEVICE][0000:01:00.0]
> BOOT0  : 0x049800a2
> Mar 25 11:50:53 ivnb kernel: [ 2703.329293] nouveau  [ DEVICE][0000:01:00.0]
> Chipset: G71 (NV49)
> Mar 25 11:50:53 ivnb kernel: [ 2703.329298] nouveau  [ DEVICE][0000:01:00.0]
> Family : NV40
> Mar 25 11:50:53 ivnb kernel: [ 2703.333377] nouveau  [ VBIOS][0000:01:00.0]
> checking PRAMIN for image...
> Mar 25 11:50:53 ivnb kernel: [ 2703.433876] nouveau  [ VBIOS][0000:01:00.0]
> ... checksum invalid
> Mar 25 11:50:53 ivnb kernel: [ 2703.433882] nouveau  [ VBIOS][0000:01:00.0]
> checking PROM for image...
> Mar 25 11:50:53 ivnb kernel: [ 2703.433896] nouveau  [ VBIOS][0000:01:00.0]
> ..
> . signature not found
> Mar 25 11:50:53 ivnb kernel: [ 2703.433901] nouveau  [ VBIOS][0000:01:00.0]
> checking ACPI for image...
> Mar 25 11:50:53 ivnb kernel: [ 2703.433905] nouveau  [ VBIOS][0000:01:00.0]
> ... signature not found
> Mar 25 11:50:53 ivnb kernel: [ 2703.433910] nouveau  [ VBIOS][0000:01:00.0]
> checking PCIROM for image...
> Mar 25 11:50:53 ivnb kernel: [ 2703.434142] nouveau  [ VBIOS][0000:01:00.0]
> ... appears to be valid
> Mar 25 11:50:53 ivnb kernel: [ 2703.434150] nouveau  [ VBIOS][0000:01:00.0]
> using image from PCIROM
> Mar 25 11:50:53 ivnb kernel: [ 2703.434323] nouveau  [ VBIOS][0000:01:00.0]
> BIT signature found
> Mar 25 11:50:53 ivnb kernel: [ 2703.434327] nouveau  [ VBIOS][0000:01:00.0]
> version 05.71.22.08.a8
> Mar 25 11:50:53 ivnb kernel: [ 2703.434464] nouveau E[ VBIOS][0000:01:00.0]
> 0xe08f[ ]: unknown opcode 0x00
> Mar 25 11:50:53 ivnb kernel: [ 2703.434469] nouveau E[
> DEVINIT][0000:01:00.0] init failed, -22
> Mar 25 11:50:53 ivnb kernel: [ 2703.434472] nouveau E[     DRM] failed to
> create 0x80000080, -22
> Mar 25 11:50:53 ivnb kernel: [ 2703.435112] nouveau: probe of 0000:01:00.0
> failed with error -22
>
> So Is there any way to fix this issue or is my notebook really too old for
> nouveau?

In general, nouveau should work just fine on all Riva TNT and newer
NVIDIA cards (NV04+). Starting with 3.13, we abort loads when the
VBIOS contains unknown opcodes (running the VBIOS is needed for
posting the card if it's a secondary, and also on resume). By far and
away the leading cause of this is reading in the "wrong" VBIOS (which
in turn is almost always PCIROM). It seems like a vbios could be found
in your PRAMIN although the signature doesn't check out -- this
happens sometimes. You can force the PRAMIN vbios by booting with

nouveau.config=NvBios=PRAMIN

Try that, I bet it'll let nouveau load.

  -ilia
