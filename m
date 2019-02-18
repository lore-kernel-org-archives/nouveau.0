From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] pci/quirks: Add quirk to reset nvgpu at boot for the
 Lenovo ThinkPad P50
Date: Mon, 18 Feb 2019 16:18:37 -0600
Message-ID: <CAErSpo66fUjkFNsCvONY8PzoCrtg-hEA+riWoq0J4pymxZcYXQ@mail.gmail.com>
References: <20190212220230.1568-1-lyude@redhat.com> <20190218211437.7FAF321738@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190218211437.7FAF321738@mail.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, DRI mailing list <dri-devel@lists.freedesktop.org>, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <skeggsb@gmail.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Mon, Feb 18, 2019 at 3:14 PM Sasha Levin <sashal@kernel.org> wrote:
>
> Hi,
>
> [This is an automated email]
>
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>
> The bot has tested the following trees: v4.20.8, v4.19.21, v4.14.99, v4.9.156, v4.4.174, v3.18.134.
>
> v4.20.8: Build OK!
> v4.19.21: Failed to apply! Possible dependencies:
>     01d5d7fa8376 ("PCI: Add macro for Switchtec quirk declarations")
>
> v4.14.99: Failed to apply! Possible dependencies:
>     01d5d7fa8376 ("PCI: Add macro for Switchtec quirk declarations")
>     06dc4ee54e30 ("PCI: Disable MSI for Freescale Layerscape PCIe RC mode")
>     07f4f97d7b4b ("vga_switcheroo: Use device link for HDA controller")
>     8948ca1a12c9 ("vga_switcheroo: Deduplicate power state tracking")
>     ad281ecf1c7d ("PCI: Add DMA alias quirk for Microsemi Switchtec NTB")
>
> v4.9.156: Failed to apply! Possible dependencies:
>     01d5d7fa8376 ("PCI: Add macro for Switchtec quirk declarations")
>     07f4f97d7b4b ("vga_switcheroo: Use device link for HDA controller")
>     3e13676862f9 ("thunderbolt: Add support for DMA configuration based mailbox")
>     46cd4b75cd0e ("efi: Add device path parser")
>     58c5475aba67 ("x86/efi: Retrieve and assign Apple device properties")
>     630b3aff8a51 ("treewide: Consolidate Apple DMI checks")
>     81a54b5e1986 ("thunderbolt: Let the connection manager handle all notifications")
>     8948ca1a12c9 ("vga_switcheroo: Deduplicate power state tracking")
>     9d3cce0b6136 ("thunderbolt: Introduce thunderbolt bus and connection manager")
>     ac6c44de503e ("thunderbolt: Expose get_route() to other files")
>     ad281ecf1c7d ("PCI: Add DMA alias quirk for Microsemi Switchtec NTB")
>     bfe778ac4982 ("thunderbolt: Convert switch to a device")
>     c9cc3aaa0281 ("thunderbolt: Use Device ROM retrieved from EFI")
>     da2da04b8d44 ("thunderbolt: Rework capability handling")
>     f67cf491175a ("thunderbolt: Add support for Internal Connection Manager (ICM)")
>     fa6d513aefe4 ("drivers:gpu: vga :vga_switcheroo.c : Fixed some coding style issues")
>
> v4.4.174: Failed to apply! Possible dependencies:
>     01d5d7fa8376 ("PCI: Add macro for Switchtec quirk declarations")
>     07f4f97d7b4b ("vga_switcheroo: Use device link for HDA controller")
>     14d2000182ed ("drm/radeon: Defer probe if gmux is present but its driver isn't")
>     156d7d4120e1 ("vga_switcheroo: Add handler flags infrastructure")
>     3a848662c751 ("vga_switcheroo: Prettify documentation")
>     412c8f7de011 ("drm/radeon: Return -EPROBE_DEFER when amdkfd not loaded")
>     704ab614ec12 ("drm/i915: Defer probe if gmux is present but its driver isn't")
>     8948ca1a12c9 ("vga_switcheroo: Deduplicate power state tracking")
>     989561de9b51 ("PM / Domains: add setter for dev.pm_domain")
>     98b3a3402eb6 ("drm/nouveau: Defer probe if gmux is present but its driver isn't")
>     a345918d6ee6 ("vga_switcheroo: Support deferred probing of audio clients")
>     ad281ecf1c7d ("PCI: Add DMA alias quirk for Microsemi Switchtec NTB")
>     b00e5334ab1b ("vga_switcheroo: Add helper for deferred probing")
>     b5f88dd1d6ef ("Revert "ACPI / LPSS: allow to use specific PM domain during ->probe()"")
>     c1e1655bb892 ("apple-gmux: Assign apple_gmux_data before registering")
>     c68f4528a2e9 ("drm/amdkfd: Track when module's init is complete")
>     fa6d513aefe4 ("drivers:gpu: vga :vga_switcheroo.c : Fixed some coding style issues")
>
> v3.18.134: Failed to apply! Possible dependencies:
>     01d5d7fa8376 ("PCI: Add macro for Switchtec quirk declarations")
>     07f4f97d7b4b ("vga_switcheroo: Use device link for HDA controller")
>     083dba02947d ("drm/nouveau/device: recognise GM204")
>     2f4a58e852d1 ("drm/nouveau/subdev: always upcast through nouveau_subdev()/nouveau_engine()")
>     4766ec53945f ("drm/nouveau/bios: add parsing of BIT M(v2) +0x03 table")
>     50e216d6e7c3 ("drm/nouveau/bios: add parsing of pmu image tables")
>     5444204036b2 ("drm/nouveau: switch to new-style timer macros")
>     7bb6d4428d3d ("drm/nouveau: move the (far too many...) different s/r paths to the same place")
>     8d5e3af15c79 ("drm/nouveau/device: Add support for GK208B, resolves bug 86935")
>     8d85e06b5e04 ("drm/nouveau/bios: add pci data structure parsing")
>     989aa5b76ad2 ("drm/nouveau/nvif: namespace of nvkm accessors (no binary change)")
>     a01ca78c8f11 ("drm/nouveau/nvif: simplify and tidy library interfaces")
>     ad281ecf1c7d ("PCI: Add DMA alias quirk for Microsemi Switchtec NTB")
>     ad4a36263535 ("drm/nouveau/bios: split out shadow methods")
>     b71a1344ec20 ("drm/nouveau/bios: add NPDE parsing")
>     ba6e34e61271 ("drm/gm204/devinit: initial implementation")
>     be83cd4ef9a2 ("drm/nouveau: finalise nvkm namespace switch (no binary change)")
>     c39f472e9f14 ("drm/nouveau: remove symlinks, move core/ to nvkm/ (no code changes)")
>     cb8bb9cedb60 ("drm/nouveau/tmr: cosmetic changes")
>     d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
>     f3867f439fd6 ("drm/nouveau/clk: rename from clock (no binary change)")
>     f8a8546194d7 ("drm/nouveau/clk: allow non-blocking for nouveau_clock_astate()")
>
>
> How should we proceed with this patch?

Is there any way we can turn off this automated checking for a while?
At this stage, where we're just trying to discuss the issue, these
emails just clutter things up.
