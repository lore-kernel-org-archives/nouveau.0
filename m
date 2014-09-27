From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH 6/7] drm/nouveau: Support marking buffers for explicit
 sync
Date: Sat, 27 Sep 2014 08:52:20 +0200
Message-ID: <54265EA4.2010509@canonical.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <1411725612-10455-7-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-7-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lauri Peltonen <lpeltonen@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

Hey,

On 26-09-14 12:00, Lauri Peltonen wrote:
> Do not attach fences automatically to buffers that are marked for
> explicit synchronization.
> 
> Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
> ---
>  drm/nouveau_bo.c           |  8 ++++----
>  drm/nouveau_bo.h           |  4 ++--
>  drm/nouveau_drm.c          |  1 +
>  drm/nouveau_gem.c          | 47 +++++++++++++++++++++++++++++++++++++++-------
>  drm/nouveau_gem.h          |  6 ++++--
>  drm/nouveau_ttm.c          |  8 ++++----
>  drm/nv50_display.c         |  2 +-
>  drm/uapi/drm/nouveau_drm.h |  5 ++++-
>  8 files changed, 60 insertions(+), 21 deletions(-)

Considering this will break on eviction, is it really needed?
If a fence is waited on before starting an operation synchronization will be a noop.

~Maarten
