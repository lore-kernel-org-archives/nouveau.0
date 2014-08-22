From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70511] nouveau_bo_name_get segmentation fault while
 running root tutorials/gl/glbox.C
Date: Fri, 22 Aug 2014 06:12:56 +0000
Message-ID: <bug-70511-8800-0EEkIHpqej@http.bugs.freedesktop.org/>
References: <bug-70511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0092786977=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0092786977==
Content-Type: multipart/alternative; boundary="1408687976.Ab18671.12144"; charset="us-ascii"


--1408687976.Ab18671.12144
Date: Fri, 22 Aug 2014 06:12:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70511

--- Comment #3 from Vittorio <zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have x86-64, NVIDIA GE6150-LE.
Linux Fedora 20 under mate desktop.
"root" is a big program from CERN, unfortunately todate I have no
smaller reproducer.
For your information the following is the text of glbox.C (you may
make glbox() into main())

void glbox()
{
// Display a 3D histogram using GL (box option).
//Author: Timur Pocheptsov
   gStyle->SetCanvasPreferGL(kTRUE);
   TCanvas *c        = new TCanvas("glc","TH3 Drawing", 100, 10, 850, 400);
   TPaveLabel *title = new TPaveLabel(0.04, 0.86, 0.96, 0.98,
                           "\"glbox\" and \"glbox1\" options for TH3.");
   title->SetFillColor(32);
   title->Draw();

   TPad *boxPad  = new TPad("box", "box", 0.02, 0.02, 0.48, 0.82);
   TPad *box1Pad = new TPad("box1", "box1", 0.52, 0.02, 0.98, 0.82);
   boxPad->Draw();
   box1Pad->Draw();

   TH3F *h31 = new TH3F("h31", "h31", 10, -1, 1, 10, -1, 1, 10, -1, 1);
   h31->FillRandom("gaus");
   h31->SetFillColor(2);
   boxPad->cd();
   h31->Draw("glbox");

   TH3F *h32 = new TH3F("h32", "h32", 10, -2, 2, 10, -1, 1, 10, -3, 3);
   h32->FillRandom("gaus");
   h32->SetFillColor(4);
   box1Pad->cd();
   h32->Draw("glbox1");
}

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408687976.Ab18671.12144
Date: Fri, 22 Aug 2014 06:12:56 +0000
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
   title="NEW --- - nouveau_bo_name_get segmentation fault while running root tutorials/gl/glbox.C"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70511#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau_bo_name_get segmentation fault while running root tutorials/gl/glbox.C"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70511">bug 70511</a>
              from <span class="vcard"><a class="email" href="mailto:zeccav&#64;gmail.com" title="Vittorio &lt;zeccav&#64;gmail.com&gt;"> <span class="fn">Vittorio</span></a>
</span></b>
        <pre>I have x86-64, NVIDIA GE6150-LE.
Linux Fedora 20 under mate desktop.
&quot;root&quot; is a big program from CERN, unfortunately todate I have no
smaller reproducer.
For your information the following is the text of glbox.C (you may
make glbox() into main())

void glbox()
{
// Display a 3D histogram using GL (box option).
//Author: Timur Pocheptsov
   gStyle-&gt;SetCanvasPreferGL(kTRUE);
   TCanvas *c        = new TCanvas(&quot;glc&quot;,&quot;TH3 Drawing&quot;, 100, 10, 850, 400);
   TPaveLabel *title = new TPaveLabel(0.04, 0.86, 0.96, 0.98,
                           &quot;\&quot;glbox\&quot; and \&quot;glbox1\&quot; options for TH3.&quot;);
   title-&gt;SetFillColor(32);
   title-&gt;Draw();

   TPad *boxPad  = new TPad(&quot;box&quot;, &quot;box&quot;, 0.02, 0.02, 0.48, 0.82);
   TPad *box1Pad = new TPad(&quot;box1&quot;, &quot;box1&quot;, 0.52, 0.02, 0.98, 0.82);
   boxPad-&gt;Draw();
   box1Pad-&gt;Draw();

   TH3F *h31 = new TH3F(&quot;h31&quot;, &quot;h31&quot;, 10, -1, 1, 10, -1, 1, 10, -1, 1);
   h31-&gt;FillRandom(&quot;gaus&quot;);
   h31-&gt;SetFillColor(2);
   boxPad-&gt;cd();
   h31-&gt;Draw(&quot;glbox&quot;);

   TH3F *h32 = new TH3F(&quot;h32&quot;, &quot;h32&quot;, 10, -2, 2, 10, -1, 1, 10, -3, 3);
   h32-&gt;FillRandom(&quot;gaus&quot;);
   h32-&gt;SetFillColor(4);
   box1Pad-&gt;cd();
   h32-&gt;Draw(&quot;glbox1&quot;);
}</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408687976.Ab18671.12144--

--===============0092786977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0092786977==--
