From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 18:29:07 +0000
Message-ID: <bug-73358-8800-u8mRdoPMK2@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0170801681=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0170801681==
Content-Type: multipart/alternative; boundary="1389983347.aAbAf1Fb1.14664"; charset="us-ascii"


--1389983347.aAbAf1Fb1.14664
Date: Fri, 17 Jan 2014 18:29:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #29 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> > And reran the tests. Same garbled screen as in comment #23. Sorry.
> 
> Blast! What about messages in dmesg? Do you still see
> 
> subc 7 class 0x0697 mthd 0x0208 data 0x00000120

Yes, (notice that the fourth line is different)

[  460.500905] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  460.500936] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.500990] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: LIMIT_COLOR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501002] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0204 data 0x00980000
[  460.501306] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501320] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.501415] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501427] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.501819] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501834] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.501925] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501937] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120


> Or are those completely gone? Those are the messages I would expect to have
> seen fixed by my patch.

The machine also hangs again.

> Also, since you're on NV34, you don't get NPOT textures either (those came
> with NV40). I wonder if the vdpau st deals with those. Hmm... it never asks
> the driver whether it has NPOT textures or not, which probably means
> not-good, and most likely accounts for your crashes. I need to look into
> exactly what the NPOT restriction should be...

I didn't even knew libvdpau was provided for nv34. Let me know if I can help.
This machine just got upgraded from 512 to 1536 megs of ram making it pretty
usable again. Testing is a lot easier as well, let me know when you have
something new.

> > Yes, you suggested this in comment #19 (or did you accidentaly ment another
> > patch?)
> 
> Wow, I must have spaced out there. My bad. It indeed is the same patch, but
> I had forgotten I already asked you about it :)

No problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389983347.aAbAf1Fb1.14664
Date: Fri, 17 Jan 2014 18:29:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre><span class="quote">&gt; &gt; And reran the tests. Same garbled screen as in <a href="show_bug.cgi?id=73358#c23">comment #23</a>. Sorry.
&gt; 
&gt; Blast! What about messages in dmesg? Do you still see
&gt; 
&gt; subc 7 class 0x0697 mthd 0x0208 data 0x00000120</span >

Yes, (notice that the fourth line is different)

[  460.500905] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  460.500936] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.500990] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: LIMIT_COLOR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501002] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0204 data 0x00980000
[  460.501306] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501320] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.501415] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501427] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.501819] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501834] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[  460.501925] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[  460.501937] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[1377]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120


<span class="quote">&gt; Or are those completely gone? Those are the messages I would expect to have
&gt; seen fixed by my patch.</span >

The machine also hangs again.

<span class="quote">&gt; Also, since you're on NV34, you don't get NPOT textures either (those came
&gt; with NV40). I wonder if the vdpau st deals with those. Hmm... it never asks
&gt; the driver whether it has NPOT textures or not, which probably means
&gt; not-good, and most likely accounts for your crashes. I need to look into
&gt; exactly what the NPOT restriction should be...</span >

I didn't even knew libvdpau was provided for nv34. Let me know if I can help.
This machine just got upgraded from 512 to 1536 megs of ram making it pretty
usable again. Testing is a lot easier as well, let me know when you have
something new.

<span class="quote">&gt; &gt; Yes, you suggested this in <a href="show_bug.cgi?id=73358#c19">comment #19</a> (or did you accidentaly ment another
&gt; &gt; patch?)
&gt; 
&gt; Wow, I must have spaced out there. My bad. It indeed is the same patch, but
&gt; I had forgotten I already asked you about it :)</span >

No problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389983347.aAbAf1Fb1.14664--

--===============0170801681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0170801681==--
