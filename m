From: "Henrik Rydberg" <rydberg@bitmath.se>
Subject: Re: [REGRESSION] nouveau: Memory corruption using nva3 engine for
 0xaf
Date: Mon, 9 Jul 2012 20:27:00 +0200
Message-ID: <20120709182700.GA383@polaris.bitmath.org>
References: <1341469873-1582-1-git-send-email-rydberg@euromail.se>
 <20120705064049.GA8693@nisroch.bne.redhat.com>
 <20120705065446.GA1849@polaris.bitmath.org>
 <20120705083410.GA395@polaris.bitmath.org>
 <20120709131325.GA22653@polaris.bitmath.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120709131325.GA22653@polaris.bitmath.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, Jul 09, 2012 at 03:13:25PM +0200, Henrik Rydberg wrote:
> On Thu, Jul 05, 2012 at 10:34:10AM +0200, Henrik Rydberg wrote:
> > On Thu, Jul 05, 2012 at 08:54:46AM +0200, Henrik Rydberg wrote:
> > > > Thanks for tracking down the source of this corruption.  I don't have
> > > > any such hardware, so until someone can figure it out, I think we
> > > > should apply this patch.
> > > 
> > > In that case, I would have to massage the patch a bit first; it
> > > creates a problem with suspend/resume. Might be something with
> > > nva3_pm.c, who knows. I am really stabbing in the dark here. :-)
> > 
> > It seems the suspend/resume problem is unrelated (bad systemd update),
> > so I am fine with applying this as is. Obviously not the best
> > solution, and if I have time I will continue to look for problems in
> > the nva3 copy code, but for now,
> > 
> >     Signed-off-by: Henrik Rydberg <rydberg@euromail.se>
> 
> I have not encountered the problem in a long while, and I do not have
> the patch applied. It is entirely possible that this was fixed by
> something else. Unless you have already applied the patch, I would
> suggest holding on to it to see if the problem reappears.
> 
> Sorry for the churn.

... and there it was again, hours after giving up on it. Oh well.

What makes this bug particularly difficult is that as soon as the
patch is applied, the problem disappears and does not show itself
again - with or without the patch applied. Sounds very much like the
problem is a failure state that does not get reset by current
mainline, but somehow gets reset with the patch applied.

I also learnt that the problem is not in the nva3_copy code itself; I
reverted nva3_copy.c and nva3_pm.c back to v3.4, but the problem persisted.

A DMA problem elsewhere, in the drm code or in the pci layer, seems
more likely than this particular hardware having problems with this
particular copy engine. As it stands, though, applying the patch is
the only thing known to work.

Thanks,
Henrik
