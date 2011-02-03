From: =?iso-8859-1?Q?Edgar_Fu=DF?= <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org>
Subject: TDMS bandwidth limits
Date: Thu, 3 Feb 2011 19:59:43 +0100
Message-ID: <DE8B09DD-4ACE-499A-A33C-C12C005803F0@math.uni-bonn.de>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

I'm curious what the TDMS bandwidth limit values in get_tmds_link_bandwidth() are based on.
We're using chipset == 44 cards that happily run 1600x1200@60 using the propriety driver and which also used to work with nouveau up to Linux 2.6.36.2. Since 2.6.37, nouveau refuses to use that mode because the required 163M pixel clock exceeds the computed TDMS bandwidth of 155M (earlier versions allowed for 165M regardless of chipset value).
Although I cannot tell for sure which timing the closed-source driver runs 1600x1200@60 with on these monitors, I find it unlikely that it uses some built-in, non-EDID timing requiring a lower pixel clock. I also don't suspect NVidia running their own chips above specs.
So either NVidia doesn't disclose the specs even to their own programmers, the values in get_tmds_link_bandwidth() are wrong, or, more likely, I'm missing something.
Patching get_tmds_link_bandwidth() to allow for 165M already for chipset >= 0x44 appears to work. However, I don't feel comfortable with stretching rates above spec.
