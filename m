From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Extend reserved memory on 0xfc000000
Date: Mon, 08 Sep 2014 11:50:02 +0200
Message-ID: <540D7BCA.3080300@free.fr>
References: <20140908121243.00080081@marian1000.go.ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140908121243.00080081-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org>
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

Le 08/09/2014 11:12, asd a =E9crit :
> Hi
>
> This patch correct on usb keyboard acces on number when enter via Ctrl
> + Alt + F12 on vt after Xorg running.Without this patch when enter on
>   vt vas unable  to use numbers from NumLock  an only numbers from main
>   keyboard.
>
>   nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x046f00a3
>   nouveau  [  DEVICE][0000:01:00.0] Chipset: G72 (NV46)
>   nouveau [  DEVICE][0000:01:00.0] Family : NV40
>   nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
>   nouveau [   VBIOS][0000:01:00.0] ... appears to be valid
>   nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
>   nouveau  [   VBIOS][0000:01:00.0] BIT signature found
>   nouveau
> [   VBIOS][0000:01:00.0] version 05.72.22.43.00
>

Seems like a useful patch but please clean it up the patch, many changes =

are unnecessary.

Please also send the patch with git send-email so as we can comment on =

the patch inline :)
