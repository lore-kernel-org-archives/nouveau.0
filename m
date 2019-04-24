From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] pci/quirks: Add quirk to reset nvgpu at boot for the
 Lenovo ThinkPad P50
Date: Wed, 24 Apr 2019 13:28:24 -0500
Message-ID: <20190424182824.GA11428@google.com>
References: <20190212220230.1568-1-lyude@redhat.com>
 <20190215004329.GR96272@google.com>
 <2fca9a9feafcd17b27bc71994a71ebc241a93e9a.camel@redhat.com>
 <52b17f8cb24e179e9661d75548d193843ae87b4c.camel@redhat.com>
 <20190321224819.GK251185@google.com>
 <20190322113015.GM251185@google.com>
 <20190404141724.GJ141706@google.com>
 <389c7b3117168209fb4760537d908a477446d013.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <389c7b3117168209fb4760537d908a477446d013.camel@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: David Ober <dober@lenovo.com>, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <skeggsb@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 24, 2019 at 01:31:09PM -0400, Lyude Paul wrote:
> Any update on this? This has been waiting for a while now

Oh, sorry, I guess we were both waiting for the other.  Let me respond to
the email with context.

> On Thu, 2019-04-04 at 09:17 -0500, Bjorn Helgaas wrote:
> > [+cc Hans, author of 0b2fe6594fa2 ("drm/nouveau: Queue hpd_work on (runtime)
> > resume")]
> -- 
> Cheers,
> 	Lyude Paul
> 
