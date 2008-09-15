From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau slower than nv and vesa on quadro 135M
Date: Mon, 15 Sep 2008 13:31:55 +0200
Message-ID: <6d4bc9fc0809150431w1d57d228n1046fad9e437a7@mail.gmail.com>
References: <48CCE4B0.1030709@aitel.hist.no>
	<6d4bc9fc0809140419k3555a843nbb77806f3d7e44ef@mail.gmail.com>
	<48CD0888.6020706@aitel.hist.no>
	<6d4bc9fc0809140629l6155dfd4xa9cd7c92defa54db@mail.gmail.com>
	<48CE432A.9040001@aitel.hist.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48CE432A.9040001-i5bjtSbraLbLX0NG8FE4ug@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Helge Hafting <helge.hafting-i5bjtSbraLbLX0NG8FE4ug@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Sep 15, 2008 at 1:12 PM, Helge Hafting
<helge.hafting-i5bjtSbraLbLX0NG8FE4ug@public.gmane.org> wrote:
> Maarten Maathuis wrote:
>
>> A profile of running this application would be useful (with nouveau
>> and xorg symbols). I have some suspicions as to the cause,
>> but some facts would be nice to have. Either oprofile or sysprof will
>> do, for oprofile we have a wiki page:
>> http://nouveau.freedesktop.org/wiki/OProfile
>>
> That wiki page doesn't list the first necessary step,
> which is "opcontrol --init". Adding that might be useful for newbies.
>
> I profiled two apps that are too slow with this driver.
> * navit (map navigation), slowly panning the map across a city. This
>  panning redraws the map each time, which is instantaneous with the
>  vesa driver.
>
> * lyx (word processor), typing text into a table. The pc could not
>  keep up with keyboard autorepeat, giving me one to three characters
>  per second. Each keypress redraws the table lines and the text
>  in the table cell.
>
> I am not sure if I have all the symbols needed. I used nouveau compiled
> per the instructions for debian. The X server consist of packages from
> debian unstable/experimental. Please tell if there is anything I can do to
> improve on this.
>
> It'd be great to get this driver closer to vesa performance, for
> vesa doesn't handle dual screens. You probably have higher goals than that.
> :-)
>
> navit profile data:
> http://www.aitel.hist.no/~helgehaf/oprofile/navit/opreport
> http://www.aitel.hist.no/~helgehaf/oprofile/navit/opreport-l
> http://www.aitel.hist.no/~helgehaf/oprofile/navit/opreport--callgraph
>
> lyx profile data:
> http://www.aitel.hist.no/~helgehaf/oprofile/lyx16/opreport
> http://www.aitel.hist.no/~helgehaf/oprofile/lyx16/opreport-1
>
> Helge Hafting
>

While the traces lack a lot of symbols (xserver's and pixman), i do
have a hunch as to the cause of the problem.

Could you add to your device section:

Option "EXAOptimizeMigration" "1"

This option seems to default to off for 1.5 (while it's on by default
for post-1.5).

If this doesn't help, then you need to get symbols for the xserver and
libpixman.

Maarten.
