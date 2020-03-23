#pragma once

#include "Niking2D/Core/Core.h"
#include "Layer.h"

#include <vector>

namespace Niking2D {

	class N2_API LayerStack {
	public:
		LayerStack();
		~LayerStack();

		void PushLayer(Layer* layer);
		void PushOverLayer(Layer* overlayer);
		void PopLayer(Layer* layer);
		void PopOverLayer(Layer* overlayer);

		std::vector<Layer*>::iterator begin() { return m_Layers.begin(); }
		std::vector<Layer*>::iterator end() { return m_Layers.end(); }



	private:
		std::vector<Layer*> m_Layers;
		unsigned int m_LayerInsertIndex = 0;

	};

}