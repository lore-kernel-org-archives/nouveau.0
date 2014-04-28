From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Missing menus in windows after update
Date: Mon, 28 Apr 2014 16:48:31 -0400
Message-ID: <CAKb7UvhhMRBUC9BBdwinfgTcwy2NYMj2qv1ENSk4vvy=JDym5A@mail.gmail.com>
References: <20140427194139.5a9d3594@Devil-Bonobo>
 <CAKb7UviNU=H=G2UarrW1FBZsHfcN2C4rePq290SEhkOKkwKWpg@mail.gmail.com>
 <20140427223301.34aa58d1@Devil-Bonobo>
 <CAKb7Uvi=x26wZfb+NneywzPCHsjjSPLwH-j2LL-SEunMR9pF3w@mail.gmail.com>
 <20140428121420.31629d84@Devil-Bonobo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140428121420.31629d84@Devil-Bonobo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Apr 28, 2014 at 3:14 PM, John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
> On Mon, 28 Apr 2014 14:07:56 -0400
> Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> dijo:
>
>>On Mon, Apr 28, 2014 at 1:33 AM, John Jason Jordan
>><johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
>>> On Sun, 27 Apr 2014 23:01:57 -0400 Ilia Mirkin
>>> <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> dijo:
>>>>On Sun, Apr 27, 2014 at 10:41 PM, John Jason Jordan
>>>><johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
>>> A couple of weeks ago the Update Manager announced that there were
>>> some updates. I do not recall exactly what packages were involved,
>>> but I remember that some of them involved nouveau. About a week ago
>>> I finally installed them, and that is when the problem began.
>
>>>>Are you using a compositor? If so, what happens if you turn it off
>>>>(or tell it not to use OpenGL, if that's an option).
>
> That was it! But not the way I think you expected. I was sure I wasn't
> using a compositor, but when I read this a second time I suddenly
> noticed that the feathered gray borders that I had around windows were
> missing. So I went into the Xfce Settings Manager and in the Window
> Manager Tweaks dialog window there is a tab for Compositor. I found
> that the checkbox there for "Show shadows under dock windows" was
> unchecked. I checked it and instantly the shadows came back. And when I
> tried LibreOffice and Claws mail all the missing lists and menu text
> was back.
>
> So the problem is solved, although I have no idea why LO and CM need
> the compositor to display menus and lists. That makes no sense to me.
> But in any event, thanks for writing that because it made my brain look
> at something I should have seen from the beginning. :)

Using a compositor alters some things, especially the drawable types
used by applications. I remember there was a bug in nvc0 mesa driver
in the 9.2 era (which was released quite some time ago already)
relating to incorrect clipping. Perhaps it's related to your issue.
This is under the assumption that the applications in question use
OpenGL for rendering at some point. Otherwise it might be an issue in
the ddx (xf86-video-nouveau), although I don't remember any issues
like that.

  -ilia
