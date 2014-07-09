From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 00/17] Convert TTM to the new fence interface.
Date: Wed, 09 Jul 2014 15:21:18 +0200
Message-ID: <53BD41CE.6000506@canonical.com>
References: <20140709093124.11354.3774.stgit@patser>
 <CAHbf0-HaFi0px7QGfBErKenH7wDU08B5mxo_QhFJdDPC4WBDrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAHbf0-HaFi0px7QGfBErKenH7wDU08B5mxo_QhFJdDPC4WBDrQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: nouveau.vger.kernel.org

op 09-07-14 15:09, Mike Lothian schreef:
> Hi Maarten
>
> Will this stop the stuttering I've been seeing with DRI3 and PRIME? Or will
> other patches / plumbing be required
>
No, that testing was with the whole series including the parts where you synchronized intel with radeon (iirc).
Although it might if lucky, I noticed that I missed a int to long conversion, which resulted in a success being
reported as error, disabling graphics acceleration entirely.

The series here simply convert the drivers to a common fence infrastructure, but shouldn't cause any regressions
or any major behavioral changes. A separate series is needed to make intel and radeon synchronized,
and for that series the support on the intel side is a hack. It should be possible to get the the radeon/nouveau
changes upstreamed, but this conversion is required for that.

~Maarten
