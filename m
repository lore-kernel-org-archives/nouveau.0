From: Roland Scheidegger <sroland@vmware.com>
Subject: Re: RFC: gallium-msaa branch merge
Date: Sat, 22 May 2010 13:29:04 +0200
Message-ID: <4BF7C000.6090001@vmware.com>
References: <4BF2C897.8090008@vmware.com>	<AANLkTilp8IaazHhOaTMTjeGc8kVnaKhKZXM60pyNrn1l@mail.gmail.com>
	<AANLkTilG7aGderzZS5KtfLPFBvKDUrFCRrdq89cNAY4m@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <AANLkTilG7aGderzZS5KtfLPFBvKDUrFCRrdq89cNAY4m@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Xavier Chantry <chantry.xavier@gmail.com>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 21.05.2010 23:40, Xavier Chantry wrote:
> Ok, after looking at how some other drivers were updated, I thought
> nouveau needed bigger changes than that.
> Jakob just pushed a simple build fix, and now nv50 builds and runs (almost ;)).
> 
> I just noticed 5 piglit regressions :
> fbo/fbo-copypix
> fbo/fbo-copyteximage
> general/scissor-copypixels
> texturing/depth-level-clamp
> texturing/texredefine
> 
> 
> And I am not sure how important is the TODO mentioned in the commit log below.
> 
> commit b59b23a51dc17da59ccff0b3f8a73009056746e5
> Author: Roland Scheidegger <sroland@vmware.com>
> Date:   Mon May 17 21:28:14 2010 +0200
> 
>     nouveau: adapt to interface changes
> 
>     this probably needs further cleanup (just getting a surface for the resource
>     seems quite nonoptimal and potentially cause unnecessary copies I think)
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev

There was some logic in nouveau which decided when to update "shadow"
surfaces (which looked a bit odd at places). That used blit flags, and
since they are gone this might not really do what it used to do. I think
if it were changed to no longer use surfaces internally for copying this
would become much more obvious what to do.

Roland
