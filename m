From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54587] [NV1F] Flickering screen on Geforece 4
Date: Sun, 09 Feb 2014 08:09:39 +0000
Message-ID: <bug-54587-8800-UvVxLtLitv@http.bugs.freedesktop.org/>
References: <bug-54587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1161713682=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1161713682==
Content-Type: multipart/alternative; boundary="1391933379.E2Ac2.7682"; charset="us-ascii"


--1391933379.E2Ac2.7682
Date: Sun, 9 Feb 2014 08:09:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54587

--- Comment #29 from Vesa <piip-O5WfVfzUwx8@public.gmane.org> ---
My VGA cable has ferrites on both ends and connectors are well secured. I have
not seen this problem with Windows, nvidia or vesa (not me) driver. Even now
with Ubuntu 10.04 and nvidia driver the screen is perfect.

I attached a new photo. It shows horizontal lines when nothing changes in the
screen contents and the hard disk is idle.

I am an embedded software programmer. I think this might have something to do
with graphic adapter bus timings. Once I had an AD converter board which had
periodical errors in DMA transfers when wait states were not set correctly.
This graphic adapter shares memory with mother board and I guess it picks other
memory bus traffic. This might not be shown if graphic adapter has an internal
memory. Do you yourself have a geforce 4?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391933379.E2Ac2.7682
Date: Sun, 9 Feb 2014 08:09:39 +0000
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
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587">bug 54587</a>
              from <span class="vcard"><a class="email" href="mailto:piip&#64;mail.com" title="Vesa &lt;piip&#64;mail.com&gt;"> <span class="fn">Vesa</span></a>
</span></b>
        <pre>My VGA cable has ferrites on both ends and connectors are well secured. I have
not seen this problem with Windows, nvidia or vesa (not me) driver. Even now
with Ubuntu 10.04 and nvidia driver the screen is perfect.

I attached a new photo. It shows horizontal lines when nothing changes in the
screen contents and the hard disk is idle.

I am an embedded software programmer. I think this might have something to do
with graphic adapter bus timings. Once I had an AD converter board which had
periodical errors in DMA transfers when wait states were not set correctly.
This graphic adapter shares memory with mother board and I guess it picks other
memory bus traffic. This might not be shown if graphic adapter has an internal
memory. Do you yourself have a geforce 4?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391933379.E2Ac2.7682--

--===============1161713682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1161713682==--
