From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: [patch] bios command length
Date: Thu, 19 Jul 2007 02:40:23 +0200
Message-ID: <6a89f9d50707181740h36e3881as29110ee01718d6a1@mail.gmail.com>
References: <469E0441.3030109@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <469E0441.3030109-S0/GAf8tV78@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephan Schmid <stephan_2303-S0/GAf8tV78@public.gmane.org>
Cc: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 7/18/07, Stephan Schmid <stephan_2303-S0/GAf8tV78@public.gmane.org> wrote:
> Hello,
> this ddx patch adds command length, offset and mult for the bios commands with ids
> 0x8f to 0x92.
> It avoids the 10000x"Init table command not found:" error messages for those bios commands.

These commands are buggy,so this is why they're disabled. Enabling
them will only cause more issues, unless you volunteer to fix them,
that is :)

Stephane
