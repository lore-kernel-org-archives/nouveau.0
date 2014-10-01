From: Lauri Peltonen <lpeltonen@nvidia.com>
Subject: Re: [RFC PATCH 7/7] drm/prime: Support explicit fence on export
Date: Wed, 1 Oct 2014 18:52:21 +0300
Message-ID: <20141001155221.GA25766@eumail.nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <1411725612-10455-8-git-send-email-lpeltonen@nvidia.com>
 <20140929074648.GC4109@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20140929074648.GC4109@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Colin Cross <ccross@android.com>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 29, 2014 at 09:46:48AM +0200, Daniel Vetter wrote:
> On Fri, Sep 26, 2014 at 01:00:12PM +0300, Lauri Peltonen wrote:
> > Allow user space to provide an explicit sync fence fd when exporting
> > a dma-buf from gem handle.  The fence will be stored as the explicit
> > fence to the reservation object.
> > 
> > Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
> 
> All existing userspace treats dma_bufs as long-lived objects. Well, all
> the userspace that expects implicit syncing, afaik Android shovels lots of
> dma-bufs around all the time (since ion is using them as it's native
> buffer handles).
> 
> So adding an exclusive fence once at export time isn't going to be
> terribly useful.
> 
> So I think a better approach would be to add this as ioctls to the dma-buf
> fd itself. Then you can also add a "give me the fence(s) for this dma_buf"
> ioctl, which is useful for interop the other way round (i.e. implicit ->
> explicit).

Yes, I like this.  I thought that one could support long-lived dma-bufs by
doing a "re-export" when a new fence needs to be attached, but your model is
indeed much nicer!


On Sat, Sep 27, 2014 at 08:49:39AM +0200, Maarten Lankhorst wrote:
> This is never true. A default resv gets allocated, see dma_buf's create
> function.

Ah, ok.  I'll keep that in mind when writing new versions. :-)


Thanks,
Lauri
