From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 00/18] drm/i915: Pimp DP DFP handling
Date: Thu, 17 Sep 2020 19:11:34 +0300
Message-ID: <20200917161134.GY6112@intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <fa772231854424f2b4edc69e23b0edd924695e6c.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa772231854424f2b4edc69e23b0edd924695e6c.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Sep 08, 2020 at 02:34:24PM -0400, Lyude Paul wrote:
> With the nitpicks addressed (note there were a couple of other spots wher=
e we
> wanted to use Return: in the kdocs, but I didn't bother pointing all of t=
hem
> out), all but patch 07 is:
> =

> Reviewed-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks for the review. I fixed up the missing/bad docs and =

pushed the lot to drm-intel-next-queued (with Daniel's irc ack).

PS.
Had to s/drm_dp_downstream_max_clock/drm_dp_downstream_max_dotclock/
in nouveau_dp.c to keep it in a buildable shape. I hope I didn't step
on too many toes with this...

-- =

Ville Syrj=E4l=E4
Intel
