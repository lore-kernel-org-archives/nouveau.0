From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] acpi: allow non-optimus setups to load vbios from acpi
Date: Thu, 27 Mar 2014 10:03:17 +1000
Message-ID: <CACAvsv4RRX9fBQA_UEiGYAsX4poOiE8G1Z1EzTuv7C3saCT=nA@mail.gmail.com>
References: <1395877041-8646-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1395877041-8646-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: cllorenz@uni-potsdam.de, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, patrick.clara@gmail.com
List-Id: nouveau.vger.kernel.org

On Thu, Mar 27, 2014 at 9:37 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> There appear to be a crop of new hardware where the vbios is not
> available from PROM/PRAMIN, but there is a valid _ROM method in ACPI.
> The data read from PCIROM almost invariably contains invalid
> instructions (still has the x86 opcodes), which makes this a low-risk
> way to try to obtain a valid vbios image.
>
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=76475
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: <stable@vger.kernel.org> # v2.6.35+
Got it, thanks!

> ---
>
> Not sure if the stable CC is warranted... it's technically not a
> regression. But it's a simple change that enables hardware to work.
>
> Patrick/Claas -- please test this out (if you're applying this to a linux
> tree, you'll have to do it manually, but it should be fairly obvious where
> this should apply).
>
>  drm/nouveau_acpi.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drm/nouveau_acpi.c b/drm/nouveau_acpi.c
> index 83face3..2792069 100644
> --- a/drm/nouveau_acpi.c
> +++ b/drm/nouveau_acpi.c
> @@ -389,9 +389,6 @@ bool nouveau_acpi_rom_supported(struct pci_dev *pdev)
>         acpi_status status;
>         acpi_handle dhandle, rom_handle;
>
> -       if (!nouveau_dsm_priv.dsm_detected && !nouveau_dsm_priv.optimus_detected)
> -               return false;
> -
>         dhandle = ACPI_HANDLE(&pdev->dev);
>         if (!dhandle)
>                 return false;
> --
> 1.8.3.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
