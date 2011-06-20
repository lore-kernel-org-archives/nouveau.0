From: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [Bug 36962] [Regression 2.6.39][nouveau][bisected?] leaving
	fullscreen XV "crashes" with KDE desktop effects enabled
Date: Mon, 20 Jun 2011 18:09:19 +0300
Message-ID: <1308582559.12612.22.camel@maxim-laptop>
References: <bug-36962-2300@https.bugzilla.kernel.org/>
	<201106201504.p5KF4GDe003241@demeter1.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <201106201504.p5KF4GDe003241@demeter1.kernel.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: bugzilla-daemon <bugzilla-daemon@bugzilla.kernel.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, 2011-06-20 at 15:04 +0000, bugzilla-daemon@bugzilla.kernel.org
wrote: 
> https://bugzilla.kernel.org/show_bug.cgi?id=36962
> 
> 
> Maxim Levitsky <maximlevitsky@gmail.com> changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |maximlevitsky@gmail.com
> 
> 
> 
> 
> --- Comment #1 from Maxim Levitsky <maximlevitsky@gmail.com>  2011-06-20 15:04:12 ---
> This is very interesting beast.
> 
> First of all, I also notice similar problem with compiz, not that often though.
> Once again, open totem, maximize, minimize, boom.
> It doesn't happen often, but when I start watching videos often it bites.
> Also XV sometimes hangs the system without any user intervention.
> 
> Now that commit that Jan Seiffert bisected looks very very suspicions.
> I can say I almost sure he found something very interesting.
> 
> Kudos to Jan Seiffert
> 


I have seen that on my NV86, and that could be the reason for hangs I
have quite often (at least one type of them...)

Best regards,
Maxim Levitsky
