From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: Recommendation for cherry-pick between 3.12 and 4.2: 0a363e85cdaf
Date: Tue, 19 Jan 2016 06:03:40 -0500
Message-ID: <CAKb7UvgEo-skaxh8nhHQ8ySJQfO157BEPpOPj2C2e-48L1WCkA@mail.gmail.com>
References: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
	<569E0E53.4010201@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <569E0E53.4010201@suse.cz>
Sender: stable-owner@vger.kernel.org
To: Jiri Slaby <jslaby@suse.cz>
Cc: stable <stable@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, Jan 19, 2016 at 5:22 AM, Jiri Slaby <jslaby@suse.cz> wrote:
> Hi,
>
> On 01/17/2016, 08:28 PM, Ilia Mirkin wrote:
>> I'd like to recommend backporting this commit:
>>
>> commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
>> Author: Hans de Goede <hdegoede@redhat.com>
>> Date:   Thu Jul 23 17:20:12 2015 +0200
>>
>>     drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c
>>
>> This disables MSI by default on G72 (NV46) devices where it's
>> apparently a bit buggy. We have a later patch which turns MSI back on
>> with a quirk, but it isn't extremely necessary for these devices, and
>> disabling (or, rather, not enabling) MSI is a pretty safe thing to do.
>>
>> The patch went upstream in 4.3-rc1, however I believe that there are
>> still a number of kernels between 3.12 (where MSI was first enabled by
>> default - commit a27e56996) and 4.2 (inclusive) which are still being
>> maintained. To those maintainers, please consider including this in
>> your trees.
>
> But it needs
> commit fa8c9ac72fe0bcdf5bc7cc84e85cc2a1af53f9fd
> Author: Ilia Mirkin <imirkin@alum.mit.edu>
> Date:   Wed Feb 5 14:33:02 2014 -0500
>
>     drm/nv4c/mc: nv4x igp's have a different msi rearm register
>
>     See https://bugs.freedesktop.org/show_bug.cgi?id=74492
>
> which is only in 3.14. So I cannot take it into 3.12.

Doh! I could have sworn that this commit was also backported, but I
guess not. I did a big more digging, a few results:

(a) v3.12 didn't actually have MSI enabled by default. It got turned
off in one of the rc's, and didn't get turned back on until v3.13. So
Jiri, you're all good (for 3.12 at least). Sorry about the wrong
version endpoints in my comment.

(b) For 3.13 stable, if such a tree exists, it wouldn't hurt to then
include both fa8c9ac72fe0bcdf5bc7cc84e85cc2a1af53f9fd as well as
4761703bd04bbdf56396d264903cc5a1fdcb3c01 (drm/nv4c/mc: disable msi) --
that one was, in fact, backported, but I guess only to 3.14. [And
without that second one, the original commit wouldn't have the desired
effect -- we want to disable MSI there, not actually flip it to the
nv4c msi rearm method.]

In case of tl;dr, my recommendation is to backport into 3.13:

fa8c9ac72fe0bcdf5bc7cc84e85cc2a1af53f9fd
4761703bd04bbdf56396d264903cc5a1fdcb3c01
0a363e85cdafbceeee6a49b91c604d0d4d070dc7

In that order. This should avoid buggy MSI on the nv4x IGPs as well as
NV46 (G72).

Starting with v3.14, you should only need
0a363e85cdafbceeee6a49b91c604d0d4d070dc7, since presumably
4761703bd04bbdf56396d264903cc5a1fdcb3c01 will have already been
backported.

Cheers,

  -ilia
