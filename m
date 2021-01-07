From: Marc MERLIN <marc_nouveau-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
Subject: Re: 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
Date: Thu, 7 Jan 2021 03:49:27 -0800
Message-ID: <20210107114927.GS32533@merlins.org>
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
 <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
 <20201229174750.GI23389@merlins.org>
 <20210104114955.GM32533@merlins.org>
 <CACO55tsdG37YKv7FV2er4hRnXk9vmwMbPuPptA+=ZtziWXC2+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACO55tsdG37YKv7FV2er4hRnXk9vmwMbPuPptA+=ZtziWXC2+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jan 04, 2021 at 02:28:37PM +0100, Karol Herbst wrote:
> mhh, that PCI config stuff should really not happen all the time, but
> it also doesn't appear to. The other thing I really don't know is, how
> well the runpm works with tools like TLP if there isn't only an audio
> device, but also the USB stuff and all the subdevices have to be
> turned off all the time in order for the GPU to stay powered down.
> 
> The firmware stuff is also just a functional problem, so you won't get
> display offloading, but it shouldn't drain your battery as long as
> nothing is connected. I'd check with "grep .
> /sys/bus/pci/devices/*/power/runtime_status" if all subdevices of the
> GPU are powered down, and check which one gets enabled regularly or
> something.

Well, all I can say is that without the firmware, my boot hung 2mn every
single time (I sent details in the logs upthread).

The battery draw issue was inconsistent. I haven't quite found what
triggers it yet.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
