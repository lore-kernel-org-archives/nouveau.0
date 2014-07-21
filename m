From: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Text sometimes missing on NV18 based laptop
Date: Mon, 21 Jul 2014 13:37:10 +0200
Message-ID: <CAFvQSYQr3Bk=eFPW5V3NUMptDhU9Q36tvu8_1zXh0oQtibQ83A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi,

On my NV18 based laptop I experience artifacts related to text
(however, 2D performance is really great these days):
- With grayscale AA text is sometimes missing, often visible on the XFCE desktop
- With subpixel (rgb) AA, even non-text related occur (icons are
misrendered, ...)

I've reported the issues here:
https://bugs.freedesktop.org/show_bug.cgi?id=81283

With noaccel it works fine, however it is annoyingly slow.

Is there anything I could try to track these issues down?

Best regards, Clemens
