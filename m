From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: one desktop on four monitors ?
Date: Mon, 25 Oct 2010 21:42:13 -0400
Message-ID: <AANLkTi=d2N5Fv-ndtgZw5uHTJrhYytO+-jkFqkKyrzRU@mail.gmail.com>
References: <201010240426.o9O4Qm8w007081@envy.delorie.com>
	<AANLkTim-Req7CGadSsTrbe4ghi9531N-KuYqW0kDufev@mail.gmail.com>
	<201010250211.o9P2BO9o002199@envy.delorie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201010250211.o9P2BO9o002199-Mhfd7Cn2s7ZOU/xweIFGFw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Oct 24, 2010 at 10:11 PM, DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org> wrote:
>
>> > While I'd prefer to use xrandr for these monitors, I've read that it's
>> > just not supported yet (sigh).
>>
>> Most of whats needed to get this working in a RandR based driver is
>> just not implemented in the server yet.
>
> What about *without* RandR ? =A0I can get it to bring up all four
> monitors sort-of, I'm OK with Xinerama for now, I just want something
> that works...
>

Nouveau doesn't support anything other than RandR. Most of the
server's old Xinerama code is also long gone, but clients can still
use the Xinerama extension and RandR will provide the screen geometry
info. However, without the proper server-side support for multiple
cards driving a single desktop all Xinerama is good for on RandR based
drivers is supporting multiple monitors on a *single* card for old
clients that only support Xinerama for screen geometry instead of
RandR. Any other configuration is likely broken. I don't think anyone
is working on multiple cards driving a single desktop so unfortunately
your #1 setup is the best you can do on 2 cards for the foreseeable
future.
