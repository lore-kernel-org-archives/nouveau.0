From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Tue, 30 Sep 2014 10:21:51 +0200
Message-ID: <20140930082151.GF24667@phenom.ffwll.local>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20140929154217.GA2851@gmail.com> <542994EC.4060009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <542994EC.4060009@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: James Jones <jajones@nvidia.com>
Cc: Stephen Warren <swarren@nvidia.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Colin Cross <ccross@android.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>, Ken Adams <KAdams@nvidia.com>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 29, 2014 at 10:20:44AM -0700, James Jones wrote:
> Additionally, I think the goal is to move to a model where some higher-level
> object such as a working set, rather than individual buffers, are assigned
> counters or sync primitives on a per-submission basis.  Versioning off tags
> for individual buffers then moves to working set modification time.  This is
> more feasible if the only thing that needs precise fencing of individual
> surfaces is lifetime management.

Yeah, there's always ways to make the fence assignment and tracking a bit
more efficient, we're playing around with working-set tricks for i915
ourselves. But fundamentally you still have fences for each buffer object
(just can't directly access them). And for buffers exported with dma_buf
you still need the direct link I think, at least when you care about
implicit syncing somewhat.

> The trend seems to be towards establishing a relatively large working set up
> front and then submitting many command buffers against it, perhaps with
> incremental modifications to the working set along the way.  This may be
> what's referred to as the Android model above, but I view it as the
> "non-glitchy graphic" model going forward.

Nah, that's something different. Afaik Android drivers don't really bother
a lot with swap and page migration and having a working shrinker for gpu
objects. At least our android guys need to disable the lowmemory killer
since that thing just goes bananas if we driver i915 memory usuage against
the wall and into swap.

I'm not really sure what you mean by "non-glitchy graphics", for me this
can mean anything from avoiding stalls to proper syncing with vblanks to
anything else really ... So might be good to elaborate here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
