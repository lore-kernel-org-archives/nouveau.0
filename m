From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Fri, 28 Dec 2012 23:38:51 +0000
Message-ID: <bug-46557-8800-QB0Wl8gjTh@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359794079=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0359794079==
Content-Type: multipart/alternative; boundary="1356737931.eC10C3aD4.24147"; charset="us-ascii"


--1356737931.eC10C3aD4.24147
Date: Fri, 28 Dec 2012 23:38:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #30 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As of kernel 3.7, xorg-1.13, nouveau DDX 1.0.4, mesa-9.0 all the errors related
to ths bug are gone for me - no distortion, no crashes, and no CACHE_ERROR,
even after switching VT and running accelerated programs for over a week.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356737931.eC10C3aD4.24147
Date: Fri, 28 Dec 2012 23:38:51 +0000
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
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557">bug 46557</a>
              from <span class="vcard"><a class="email" href="mailto:salah.coronya&#64;gmail.com" title="Salah Coronya &lt;salah.coronya&#64;gmail.com&gt;"> <span class="fn">Salah Coronya</span></a>
</span></b>
        <pre>As of kernel 3.7, xorg-1.13, nouveau DDX 1.0.4, mesa-9.0 all the errors related
to ths bug are gone for me - no distortion, no crashes, and no CACHE_ERROR,
even after switching VT and running accelerated programs for over a week.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356737931.eC10C3aD4.24147--

--===============0359794079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0359794079==--
