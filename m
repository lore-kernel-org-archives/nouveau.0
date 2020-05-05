From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: problems with NVS310
Date: Tue, 5 May 2020 11:17:04 -0400
Message-ID: <CAKb7Uvjt77zM0ATjwCNcCAh46+kj8HkOAinuN8vdUACKcPPGjg@mail.gmail.com>
References: <46ba2ff8-c8cf-0f72-62d0-b17178b0f2ac@tripolho.com>
 <CAKb7UvguvnBnauKhcc4CPoZE=vRzj46JWKQDND=MBJZ89p13vg@mail.gmail.com>
 <a6346e40-a4ed-0d59-47c9-3afea2dd7274@tripolho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <a6346e40-a4ed-0d59-47c9-3afea2dd7274-TKBR8cLbdHhWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alberto Sentieri <22t-TKBR8cLbdHhWk0Htik3J/w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, May 5, 2020 at 11:02 AM Alberto Sentieri <22t-TKBR8cLbdHhWk0Htik3J/w@public.gmane.org> wrote:
>
> I have two monitors connected to the PC. One is an AOC 23" (1920 x 1080)
> and the other is a BenQ 27" (2560 x 1440). Nothing special about them.
> BenQ has a display port and the AOC uses some sort of DVI adapter.

Do you know if the DVI adapter is active or passive? (If you include
the EDID, that should become apparent. It should be visible in "xrandr
--props")

>
> I have this event many times and I captured dmesg twice. At least at one
> time I captured dmesg my computer was under high load: it had about 15
> to 20 windows opened (spreadsheets, Thunderbird, Firefox, virtual
> machines under virtual box), there was a lot of disk activity and I was
> as trying to capture a screenshot from Firefox using the screenshot
> tool. I could not make everything fit into one screen, so I hit F11
> (while in Firefox), captured what I needed (now it fit), and when I
> pressed F11 again to make Firefox come back to a regular window, it
> locked: I could not move the mouse and caps lock led was frozen.

Hm, moving between full screen/not is at least a page-flip if wayland
is being used. I guess it's plausible.

  -ilia
