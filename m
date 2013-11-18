From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Mon, 18 Nov 2013 23:46:11 +0000
Message-ID: <bug-71659-8800-YrHGoJ49rz@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0979066861=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0979066861==
Content-Type: multipart/alternative; boundary="1384818371.Bfb8AAF1.23613"; charset="us-ascii"


--1384818371.Bfb8AAF1.23613
Date: Mon, 18 Nov 2013 23:46:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #8 from R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org ---
This bug seemed to become harder to trigger when I installed git-as-of-Oct-26,
then easier again when I installed git-as-of-Nov-14, but given that this change
seemed to persist after returning to 3.11 (suggesting a left-behind
configuration change) and the general randomness of the bug, this would not
give a reliable bisection (so the date mismatch doesn't rule out #71662 being
the same bug).

In 3.8.0 the same symptoms occur but the log message is
nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x01000000
I suspect (but have not tested) that this change was
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c?id=32256c87ead3edec86bed5023a0ff96a6d907931
,i.e. this error was what is now the warning.

Is 0x00800000 unhandled because it is an inherently fatal error, or because
nobody outside Nvidia knows what it means?
https://github.com/envytools/envytools/blob/master/hwdocs/fifo/nvc0-pfifo.rst
is a contentless stub.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384818371.Bfb8AAF1.23613
Date: Mon, 18 Nov 2013 23:46:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="R.Palmer&#64;bham.ac.uk">R.Palmer&#64;bham.ac.uk</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>jano.vesely&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="R.Palmer&#64;bham.ac.uk">R.Palmer&#64;bham.ac.uk</a>
</span></b>
        <pre>This bug seemed to become harder to trigger when I installed git-as-of-Oct-26,
then easier again when I installed git-as-of-Nov-14, but given that this change
seemed to persist after returning to 3.11 (suggesting a left-behind
configuration change) and the general randomness of the bug, this would not
give a reliable bisection (so the date mismatch doesn't rule out #71662 being
the same bug).

In 3.8.0 the same symptoms occur but the log message is
nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x01000000
I suspect (but have not tested) that this change was
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c?id=32256c87ead3edec86bed5023a0ff96a6d907931">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c?id=32256c87ead3edec86bed5023a0ff96a6d907931</a>
,i.e. this error was what is now the warning.

Is 0x00800000 unhandled because it is an inherently fatal error, or because
nobody outside Nvidia knows what it means?
<a href="https://github.com/envytools/envytools/blob/master/hwdocs/fifo/nvc0-pfifo.rst">https://github.com/envytools/envytools/blob/master/hwdocs/fifo/nvc0-pfifo.rst</a>
is a contentless stub.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384818371.Bfb8AAF1.23613--

--===============0979066861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0979066861==--
