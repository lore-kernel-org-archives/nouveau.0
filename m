From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: screen flicker
Date: Tue, 15 Nov 2011 19:12:43 +0100
Message-ID: <20111115181243.GA3415@joi.lan>
References: <4EC2742F.2040504@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EC2742F.2040504-H+0wwilmMs3R7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bill Moss <bill.moss-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Nov 15, 2011 at 09:16:15AM -0500, Bill Moss wrote:
> I recently moved my openSUSE 11.4 system from the
> proprietary drivers to nouveau. After much grief due to the
> sometimes conflicting instruction on the Internet and
> applications that placed out of date shared objects
> (libraries) in /usr/local/lib which is searched first by
> ld.so, I have it working on a 19" wide screen LCD monitor at
> 1440x900.
> 
> However, there is a distinct and periodic flicker that was
> not present with the NVIDIA drivers and the font rendering
> is not as crisp. I'm using the nouveau as supplied by the
> standard repositories of openSUSE (zypper repos).

Does it go away if you add
Option "PageFlip" "0"
to Device section of xorg.conf?
If yes, this is https://bugs.freedesktop.org/show_bug.cgi?id=42398

If not, please read http://nouveau.freedesktop.org/wiki/Bugs
and open new bug report with all mentioned logs.

Marcin
