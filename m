From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94817] Nearest neighbor scaling?
Date: Tue, 05 Apr 2016 21:29:09 +0000
Message-ID: <bug-94817-8800-G9bSXaL14p@http.bugs.freedesktop.org/>
References: <bug-94817-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2077048370=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94817-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2077048370==
Content-Type: multipart/alternative; boundary="14598917490.fA86DF2Ca.26618";
 charset="UTF-8"


--14598917490.fA86DF2Ca.26618
Date: Tue, 5 Apr 2016 21:29:09 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94817

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |NOTABUG
             Status|NEW                         |RESOLVED

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to nw9165-3201 from comment #2)
> Hi,
> 
> actually I have submitted the same feature request for the Intel and AMD
> drivers and also for the NVIDIA proprietary one as well yesterday. It has
> resulted in a patch for xrandr that allows to use nearest neighbor scaling
> now, see:
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=94816
> https://bugs.freedesktop.org/show_bug.cgi?id=94820
> https://bugs.freedesktop.org/show_bug.cgi?id=94819
> 
> Anyway, as already being discussed in those three threads, it would be
> interesting to know if the dedicated hardware scaler inside the GPU could
> also be used for this instead of using xrandr.
> 
> Can anyone comment on this?
> 
> Regards

The thing I suggested earlier will use hw for scaling. Run 'xrandr --props' to
find the exact property. IOW the feature already exists.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598917490.fA86DF2Ca.26618
Date: Tue, 5 Apr 2016 21:29:09 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817">bug 94817</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817">bug 94817</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to nw9165-3201 from <a href="show_bug.cgi?id=94817#c2">comment #2</a>)
<span class="quote">&gt; Hi,
&gt; 
&gt; actually I have submitted the same feature request for the Intel and AMD
&gt; drivers and also for the NVIDIA proprietary one as well yesterday. It has
&gt; resulted in a patch for xrandr that allows to use nearest neighbor scaling
&gt; now, see:
&gt; 
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94816">https://bugs.freedesktop.org/show_bug.cgi?id=94816</a>
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94820">https://bugs.freedesktop.org/show_bug.cgi?id=94820</a>
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94819">https://bugs.freedesktop.org/show_bug.cgi?id=94819</a>
&gt; 
&gt; Anyway, as already being discussed in those three threads, it would be
&gt; interesting to know if the dedicated hardware scaler inside the GPU could
&gt; also be used for this instead of using xrandr.
&gt; 
&gt; Can anyone comment on this?
&gt; 
&gt; Regards</span >

The thing I suggested earlier will use hw for scaling. Run 'xrandr --props' to
find the exact property. IOW the feature already exists.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598917490.fA86DF2Ca.26618--

--===============2077048370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2077048370==--
