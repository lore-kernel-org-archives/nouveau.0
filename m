From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] PCI: Use pci_reset_bus() in
 quirk_reset_lenovo_thinkpad_50_nvgpu()
Date: Mon, 12 Aug 2019 15:13:20 -0400
Message-ID: <c526638ef31f5b8fb7782e1a4f034fcf78088c4a.camel@redhat.com>
References: <20190801220117.14952-1-lyude@redhat.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801220117.14952-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Cc: Daniel Drake <drake@endlessm.com>, Bjorn Helgaas <bhelgaas@google.com>, Aaron Plattner <aplattner@nvidia.com>, Peter Wu <peter@lekensteyn.nl>, Ilia Mirkin <imirkin@alum.mit.edu>, Karol Herbst <kherbst@redhat.com>, Maik Freudenberg <hhfeuer@gmx.de>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Bjorn, is there any update on getting this accepted?

On Thu, 2019-08-01 at 18:01 -0400, Lyude Paul wrote:
> Since quirk_nvidia_hda() was added there's now two nvidia device
> functions on any laptops with nvidia GPUs: the HDA controller, and the
> GPU itself. Unfortunately this has the sideaffect of breaking
> quirk_reset_lenovo_thinkpad_50_nvgpu() since pci_reset_function() was
> using pci_parent_bus_reset() to reset the GPU's respective PCI bus, and
> pci_parent_bus_reset() does not work on busses which have more then a
> single device function present.
> 
> So, fix this by simply calling pci_reset_bus() instead which properly
> resets the GPU bus and all device functions under it, including both the
> GPU and the HDA controller.
> 
> Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Daniel Drake <drake@endlessm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Aaron Plattner <aplattner@nvidia.com>
> Cc: Peter Wu <peter@lekensteyn.nl>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Maik Freudenberg <hhfeuer@gmx.de>
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/pci/quirks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 208aacf39329..44c4ae1abd00 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -5256,7 +5256,7 @@ static void quirk_reset_lenovo_thinkpad_p50_nvgpu(struct
> pci_dev *pdev)
>  	 */
>  	if (ioread32(map + 0x2240c) & 0x2) {
>  		pci_info(pdev, FW_BUG "GPU left initialized by EFI,
> resetting\n");
> -		ret = pci_reset_function(pdev);
> +		ret = pci_reset_bus(pdev);
>  		if (ret < 0)
>  			pci_err(pdev, "Failed to reset GPU: %d\n", ret);
>  	}
