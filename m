From: =?ISO-8859-1?Q?Thomas_Hellstr=F6m?= <thomas@shipmail.org>
Subject: Re: Why was old TTM removed from drm.git?
Date: Wed, 24 Jun 2009 19:26:41 +0200
Message-ID: <4A4261D1.8070204@shipmail.org>
References: <20090624194306.0730cb2f@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20090624194306.0730cb2f@daedalus.pq.iki.fi>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: Pekka Paalanen <pq@iki.fi>
Cc: nouveau@lists.freedesktop.org, thellstrom@vmware.com, dri-devel@lists.sf.net
List-Id: nouveau.vger.kernel.org

Hi, Pekka!

I'm sorry for this breakage. I thought drm master was currently used 
only for libdrm development, but
I see now that I didn't pay enough attention. Just prior to the commit I 
sent out a message explaining what I was going to do and why, but 
apparently it didn't make it to the list (which seems to be the case of 
quite a few mails these days).

Please feel free to revert that commit and pull it in again when you 
think it's OK, or perhaps anchor a nouveau drm branch just ahead of this 
commit. The old TTM is completely unmaintained and blocks any attempt to 
bring the drm.git master repo reasonably up to sync with what's in the 
kernel, so the sooner it goes away the better.

Again, Sorry for the breakage.

/Thomas


Pekka Paalanen wrote:
> Hi Thomas,
>
> I meant to ask you this 24h ago:
> why did you deliberately break Nouveau in drm.git?
>
> The commit 9a33f62be1c478334572ea9384af60 "drm: Strip old ttm." not only
> removes the old TTM, it explicitly removes Nouveau from Makefile. IMHO
> this means you knew it broke Nouveau and you did not care. And there is
> no explanation in the commit as to why. Did you ask any Nouveau developer
> if it was ok?
>
> It is true, that Nouveau is aiming for its own kernel tree for DRM
> development, but it is not for all end users yet. Majority of our users
> use the drm.git kernel modules for Nouveau, and now we get to explain
> how it is not there anymore, and we have no guide to point them to.
>
> 2.6.31-rc1 is coming, bearing newTTM. If you had waited a week, we would
> have had the kernel tree up and user documentation written on how to
> build that, and breaking Nouveau in drm.git would not have mattered.
>
> Well, rc1 is so near, that we probably won't bother fixing Nouveau in
> drm.git. I just wish the transition would have been Nouveau developers'
> decision.
>
>
> Regards, pq
>
>   




------------------------------------------------------------------------------
--
